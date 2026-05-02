import 'package:advanced_store_project/core/networking/api_result.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/categorie_response_data.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/items_response_data.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/repo/categories_repo.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/repo/items_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesRepo _categoriesRepo;
  final ItemsRepo _itemsRepo;
  HomeBloc(this._categoriesRepo, this._itemsRepo) : super(const HomeState.initial()) {
    on<_DotsChanging>((event, emit) {
      emit(HomeState.dotsChanging(event.index));
    });
    on<_GetCategories>((event, emit) async {
      emit(HomeState.getCategoriesLoading());
      final response = await _categoriesRepo.getCategories();
      // print("response: $response");
      response.when(
        success: (data) {
          // print("data success:$data");
          emit(HomeState.getCategoriesSuccess(data));
        },
        failure: (error) {
          // print("error: $error");
          // print("error message: ${error.message}");
          emit(HomeState.getCategoriesError());
        },
      );
    });
    on<_GetItems>((event, emit) async {
      emit(HomeState.getItemsLoading());
      final response = await _itemsRepo.getItems();
      print("response: $response");
      response.when(
        success: (data) {
          print("data success:$data");
          emit(HomeState.getItemsSuccess(data));
        },
        failure: (error) {
          print("error: $error");
          print("error message: ${error.message}");
          emit(HomeState.getItemsError());
        },
      );
    });
  }
}
