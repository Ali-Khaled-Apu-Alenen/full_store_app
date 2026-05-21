import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/functions/build_category_image.dart';
import 'package:ali_store/core/styles/font_weights.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/data/model/items_response_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum ItemTileLayout { grid, horizontal }

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.isArabic,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
    this.layout = ItemTileLayout.grid,
  });

  final Item item;
  final bool isArabic;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;
  final ItemTileLayout layout;

  String get _name => isArabic ? item.item_name_ar : item.item_name;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = layout == ItemTileLayout.horizontal;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: isHorizontal ? 99.h : 134.h,
            width: isHorizontal ? 126.w : 155.w,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(8),
              boxShadow: isHorizontal
                  ? [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : null,
            ),
            child: Stack(
              children: [
                Hero(
                  tag: 'category_image_${item.item_id}',
                  child: buildCategoryImage(item.item_image, item.item_id),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    margin: EdgeInsets.only(
                      top: isHorizontal ? 8.h : 10.h,
                      right: 8.w,
                    ),
                    child: InkWell(
                      onTap: onFavoriteTap,
                      child: Image.asset(
                        isFavorite
                            ? 'asset/images/favorit_filled.png'
                            : 'asset/images/favorate.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h),
        if (isHorizontal) ...[
          Text(_name, style: TextStyles.font14SimiBoldBlack),
          Text(
            '${item.item_price}\$',
            style: TextStyle(
              fontSize: 12,
              color: HomeColors.primaryColor,
              fontWeight: FontWeights.semiBold,
            ),
          ),
        ] else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(_name, style: TextStyles.font14SimiBoldBlack),
                  Text(
                    '${item.item_price}\$',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: HomeColors.primaryColor,
                      fontWeight: FontWeights.semiBold,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40.w),
              SvgPicture.asset('asset/svgs/add.svg'),
            ],
          ),
      ],
    );
  }
}
