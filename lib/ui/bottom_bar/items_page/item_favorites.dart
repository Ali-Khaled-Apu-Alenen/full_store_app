import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/search/logic/cubit/search_cubit.dart';

/// Shared favorite actions for item tiles across home, search, and category pages.
class ItemFavorites {
  const ItemFavorites({
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final bool Function(int itemId) isFavorite;
  final Future<void> Function(int itemId) onToggleFavorite;

  factory ItemFavorites.fromHomeBloc(HomeBloc bloc) {
    return ItemFavorites(
      isFavorite: (itemId) => bloc.favoriteItems.contains(itemId),
      onToggleFavorite: (itemId) async {
        bloc.add(
          HomeEvent.changeFavoriteItem(
            itemId,
            !bloc.favoriteItems.contains(itemId),
          ),
        );
      },
    );
  }

  factory ItemFavorites.fromSearchCubit(SearchCubit cubit) {
    return ItemFavorites(
      isFavorite: cubit.isFavorite,
      onToggleFavorite: cubit.toggleFavorite,
    );
  }
}
