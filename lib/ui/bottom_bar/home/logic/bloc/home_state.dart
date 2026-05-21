part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.dotsChanging(int index) = _DotsChangingState;
  const factory HomeState.getCategoriesLoading() = _GetCategoriesLoading;
  const factory HomeState.getCategoriesSuccess(CategorieResponseData data) =
      _GetCategoriesSuccess;
  const factory HomeState.getCategoriesError() = _GetCategoriesError;
  const factory HomeState.getItemsLoading() = _GetItemsLoading;
  const factory HomeState.getItemsSuccess({
    required ItemsResponseData data,
    @Default(0) int favoriteRevision,
  }) = _GetItemsSuccess;
  const factory HomeState.getItemsError() = _GetItemsError;
}
