import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/functions/build_category_image.dart';
import 'package:ali_store/core/styles/font_weights.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomGridView extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;
  final VoidCallback onPreased;

  const CustomGridView({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    required this.onPreased, 
  
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
            height: 134,
            width: 155,
            
            decoration: BoxDecoration(
              
            color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                buildCategoryImage(itemImage),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.only(top: 10, right: 8),
                    child: Image.asset("asset/images/favorit_filled.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 2),
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
            SizedBox(width: 40),
            SvgPicture.asset("asset/svgs/add.svg"),
          ],
        ),
      ],
    );
  }
}
