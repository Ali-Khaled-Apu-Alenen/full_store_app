import 'package:ali_store/data/model/items_response_data.dart';
import 'package:ali_store/ui/bottom_bar/details/details_page.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_favorites.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_tile.dart';
import 'package:flutter/material.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({
    super.key,
    required this.items,
    required this.isArabic,
    required this.favorites,
    this.favoriteRevision = 0,
    this.padding = const EdgeInsets.all(10),
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
  });

  final List<Item> items;
  final bool isArabic;
  final ItemFavorites favorites;
  final int favoriteRevision;
  final EdgeInsets padding;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: ValueKey(favoriteRevision),
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemTile(
          item: item,
          isArabic: isArabic,
          isFavorite: favorites.isFavorite(item.item_id),
          onFavoriteTap: () => favorites.onToggleFavorite(item.item_id),
          onTap: () => _openDetails(context, item),
        );
      },
    );
  }

  void _openDetails(BuildContext context, Item item) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => DetailsPage(item: item)),
    );
  }
}
