import 'package:ali_store/core/constatnt/shared_pref_keys.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/services/shared_preferences_helper.dart';
import 'package:ali_store/data/model/items_request_data.dart';
import 'package:ali_store/data/model/items_response_data.dart';
import 'package:ali_store/data/model/repo/items_repo.dart';
import 'package:ali_store/data/model/repo/set_favorite_repo.dart';
import 'package:ali_store/data/model/set_favorite_request.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._itemsRepo, this._setFavoriteRepo)
    : super(const SearchState.initial());

  final ItemsRepo _itemsRepo;
  final SetFavoriteRepo _setFavoriteRepo;

  ItemsResponseData? _items;
  String _currentQuery = '';
  final Set<int> favoriteItems = {};
  int _favoriteRevision = 0;

  /// Loads all items from the API and syncs favorite flags for the current user.
  Future<void> loadItems() async {
    emit(const SearchState.gettingItems());

    final userId = await SharedPreferencesHelper.getInt(
      SharedPrefKeys.userDataKey,
    );
    if (userId == null) {
      emit(const SearchState.getItemsError());
      return;
    }

    final response = await _itemsRepo.getItems(
      ItemsRequestData(userId: userId),
    );

    response.when(
      success: (data) {
        _items = data;
        _syncFavoritesFromItems(data.data);
        _emitDisplayedItems();
      },
      failure: (_) => emit(const SearchState.getItemsError()),
    );
  }

  @Deprecated('Use loadItems() instead')
  Future<void> emitSearchState() => loadItems();

  /// Filters items by English or Arabic name and updates the displayed list.
  void searchItems(String query) {
    _currentQuery = query.trim();
    if (_items == null) return;
    _emitDisplayedItems();
  }

  bool isFavorite(int itemId) => favoriteItems.contains(itemId);

  /// Toggles favorite on the server and updates the local list without refetching.
  Future<void> toggleFavorite(int itemId) async {
    final willFavorite = !isFavorite(itemId);
    final success = await _setFavorite(itemId);
    if (!success) return;

    if (willFavorite) {
      favoriteItems.add(itemId);
    } else {
      favoriteItems.remove(itemId);
    }

    _favoriteRevision++;
    _emitDisplayedItems();
  }

  void _syncFavoritesFromItems(List<Item> items) {
    favoriteItems
      ..clear()
      ..addAll(
        items.where((item) => item.favorite == 1).map((item) => item.item_id),
      );
  }

  void _emitDisplayedItems() {
    emit(
      SearchState.getItemsSuccess(
        items: _filteredItems(),
        favoriteRevision: _favoriteRevision,
      ),
    );
  }

  List<Item> _filteredItems() {
    final allItems = _items?.data ?? [];
    if (_currentQuery.isEmpty) return allItems;

    final query = _currentQuery.toLowerCase();
    return allItems
        .where(
          (item) =>
              item.item_name.toLowerCase().contains(query) ||
              item.item_name_ar.toLowerCase().contains(query),
        )
        .toList();
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
