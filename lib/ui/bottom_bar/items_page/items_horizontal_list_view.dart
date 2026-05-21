import 'package:ali_store/data/model/items_response_data.dart';
import 'package:ali_store/ui/bottom_bar/details/details_page.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_favorites.dart';
import 'package:ali_store/ui/bottom_bar/items_page/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsHorizontalListView extends StatelessWidget {
  const ItemsHorizontalListView({
    super.key,
    required this.items,
    required this.isArabic,
    required this.favorites,
    this.favoriteRevision = 0,
    this.height,
    this.width,
    this.margin,
  });

  final List<Item> items;
  final bool isArabic;
  final ItemFavorites favorites;
  final int favoriteRevision;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(favoriteRevision),
      margin: margin ?? EdgeInsets.only(left: 18.w),
      width: width ?? 410.w,
      height: height ?? 142.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: EdgeInsets.only(right: 16.w),
            child: ItemTile(
              item: item,
              isArabic: isArabic,
              layout: ItemTileLayout.horizontal,
              isFavorite: favorites.isFavorite(item.item_id),
              onFavoriteTap: () => favorites.onToggleFavorite(item.item_id),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
