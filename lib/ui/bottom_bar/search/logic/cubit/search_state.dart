part of 'search_cubit.dart';

@freezed
sealed class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.gettingItems() = _GettingItems;
  const factory SearchState.getItemsSuccess({
    required List<Item> items,
    @Default(0) int favoriteRevision,
  }) = _GetItemsSuccess;
  const factory SearchState.getItemsError() = _GetItemsError;
}
