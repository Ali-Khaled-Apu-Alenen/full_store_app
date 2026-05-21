import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/data/model/items_response_data.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_favorites.dart';
import 'package:ali_store/ui/bottom_bar/items_page/items_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsPage extends StatelessWidget {
  final int categoryId;

  const ItemsPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == Languages.arabic;
    context.read<HomeBloc>().add(const HomeEvent.getItems());

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('items.Products'.tr(), style: TextStyles.font16SimiBold),
        ),
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
            getItemsSuccess: (ItemsResponseData items, favoriteRevision) {
              final chosenItems = items.data
                  .where((item) => item.items_categorie == categoryId)
                  .toList();

              if (chosenItems.isEmpty) {
                return Center(
                  child: Text('No items found in this category'.tr()),
                );
              }

              return ItemsGridView(
                items: chosenItems,
                isArabic: isArabic,
                favorites: ItemFavorites.fromHomeBloc(context.read<HomeBloc>()),
                favoriteRevision: favoriteRevision,
              );
            },
            orElse: () => Center(child: Text('items.Error'.tr())),
          );
        },
      ),
    );
  }
}
