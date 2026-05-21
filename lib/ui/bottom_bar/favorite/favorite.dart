import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_favorites.dart';
import 'package:ali_store/ui/bottom_bar/items_page/items_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeEvent.getItems());
    });
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == Languages.arabic;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'.tr()),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current.maybeWhen(
          getItemsLoading: () => true,
          getItemsSuccess: (_, __) => true,
          getItemsError: () => true,
          orElse: () => false,
        ),
        builder: (context, state) {
          return state.maybeWhen(
            getItemsLoading: () =>
                const Center(child: CircularProgressIndicator()),
            getItemsError: () => Center(child: Text('items.Error'.tr())),
            getItemsSuccess: (data, favoriteRevision) {
              final bloc = context.read<HomeBloc>();
              final favoriteItems = data.data
                  .where((item) => bloc.favoriteItems.contains(item.item_id))
                  .toList();

              if (favoriteItems.isEmpty) {
                return Center(child: Text('No favorites yet'.tr()));
              }

              return ItemsGridView(
                items: favoriteItems,
                isArabic: isArabic,
                favorites: ItemFavorites.fromHomeBloc(bloc),
                favoriteRevision: favoriteRevision,
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
