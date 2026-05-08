import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/functions/build_category_image.dart';
import 'package:ali_store/core/styles/font_weights.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;
  final VoidCallback onPreased;
  final int itemId;

  const CustomGridView({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    required this.onPreased, 
    required this.itemId,
  
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPreased,
          child: Container(
            height: 134.h,
            width: 155.w,
            
            decoration: BoxDecoration(
              
            color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Hero(
                  tag: "category_image_$itemId",
                  child: buildCategoryImage(itemImage,itemId),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    margin: EdgeInsets.only(top: 10.h, right: 8.w),
                    child: Image.asset("asset/images/favorit_filled.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  // categories[index].item_name,
                  itemName,
                  style: TextStyles.font14SimiBoldBlack,
                ),
                Text(
                  "$itemPrice\$",
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
            SvgPicture.asset("asset/svgs/add.svg"),
          ],
        ),
      ],
    );
  }
}
