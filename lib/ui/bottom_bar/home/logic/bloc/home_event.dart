part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.dotsChanging(int index) = _DotsChanging;
  const factory HomeEvent.getCategories() = _GetCategories;
  const factory HomeEvent.getItems() = _GetItems;
  const factory HomeEvent.changeFavoriteItem(int itemId, bool isFavorite) = _ChangeFavoriteItem;
}

