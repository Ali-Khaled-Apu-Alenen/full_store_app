import 'package:ali_store/core/constatnt/shared_pref_keys.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/services/shared_preferences_helper.dart';
import 'package:ali_store/data/model/categorie_response_data.dart';
import 'package:ali_store/data/model/items_request_data.dart';
import 'package:ali_store/data/model/items_response_data.dart';
import 'package:ali_store/data/model/repo/categories_repo.dart';
import 'package:ali_store/data/model/repo/items_repo.dart';
import 'package:ali_store/data/model/repo/set_favorite_repo.dart';
import 'package:ali_store/data/model/set_favorite_request.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesRepo _categoriesRepo;
  final ItemsRepo _itemsRepo;
  final SetFavoriteRepo _setFavoriteRepo;

  final Set<int> favoriteItems = {};
  ItemsResponseData? _cachedItems;
  int _favoriteRevision = 0;

  HomeBloc(this._categoriesRepo, this._itemsRepo, this._setFavoriteRepo)
      : super(const HomeState.initial()) {
    on<_DotsChanging>((event, emit) {
      emit(HomeState.dotsChanging(event.index));
    });
    on<_GetCategories>((event, emit) async {
      emit(const HomeState.getCategoriesLoading());
      final response = await _categoriesRepo.getCategories();
      response.when(
        success: (data) => emit(HomeState.getCategoriesSuccess(data)),
        failure: (_) => emit(const HomeState.getCategoriesError()),
      );
    });
    on<_GetItems>((event, emit) async {
      final userId = await SharedPreferencesHelper.getInt(
        SharedPrefKeys.userDataKey,
      );
      emit(const HomeState.getItemsLoading());
      final response = await _itemsRepo.getItems(
        ItemsRequestData(userId: userId),
      );
      response.when(
        success: (data) {
          _cachedItems = data;
          _syncFavoritesFromItems(data.data);
          emit(
            HomeState.getItemsSuccess(
              data: data,
              favoriteRevision: _favoriteRevision,
            ),
          );
        },
        failure: (_) => emit(const HomeState.getItemsError()),
      );
    });
    on<_ChangeFavoriteItem>((event, emit) async {
      final isSuccess = await _setFavorite(event.itemId);
      if (!isSuccess) return;

      if (event.isFavorite) {
        favoriteItems.add(event.itemId);
      } else {
        favoriteItems.remove(event.itemId);
      }

      _favoriteRevision++;
      _emitCachedItems(emit);
    });
  }

  bool isFavorite(int itemId) => favoriteItems.contains(itemId);

  void _syncFavoritesFromItems(List<Item> items) {
    favoriteItems
      ..clear()
      ..addAll(
        items.where((item) => item.favorite == 1).map((item) => item.item_id),
      );
  }

  void _emitCachedItems(Emitter<HomeState> emit) {
    if (_cachedItems == null) return;
    emit(
      HomeState.getItemsSuccess(
        data: _cachedItems!,
        favoriteRevision: _favoriteRevision,
      ),
    );
  }

  Future<bool> _setFavorite(int itemId) async {
    final userId = await SharedPreferencesHelper.getInt(
      SharedPrefKeys.userDataKey,
    );
    if (userId == null) return false;

    final response = await _setFavoriteRepo.setFavorite(
      SetFavoriteRequest(userId: userId, itemId: itemId),
    );

    return response.when(success: (_) => true, failure: (_) => false);
  }
}
