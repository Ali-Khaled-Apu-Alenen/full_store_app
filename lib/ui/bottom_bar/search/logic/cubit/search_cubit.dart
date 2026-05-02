import 'package:advanced_store_project/core/networking/api_result.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/items_response_data.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/repo/items_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final ItemsRepo _itemsRepo;
  ItemsResponseData? _items;
  
  SearchCubit(this._itemsRepo) : super(SearchState.initial());
  emitSearchState() async {
    emit(SearchState.initial());

    final response = await _itemsRepo.getItems();
    response.when(
      success: (data) {
        _items = data;
        emit(SearchState.getItemsSuccess(data.data));
      },
      failure: (error) {
        emit(SearchState.getItemsError());
      },
    );
  }

  List<Item> searchItems(String query) {
    if (query.isEmpty || _items == null) {
      emit(SearchState.getItemsSuccess(_items?.data ?? []));
      return _items?.data ?? [];
    } else {
      final filteredItems = _items?.data
          .where(
            (item) =>
                item.item_name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      if (filteredItems!.isNotEmpty) {
        emit(SearchState.getItemsSuccess(filteredItems));
        return filteredItems;
      } else {
        emit(SearchState.getItemsSuccess([]));
        return [];
      }
    }
  
  }
}
