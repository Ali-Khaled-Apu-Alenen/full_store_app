import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/constatnt/languages.dart';
import 'package:advanced_store_project/core/functions/build_category_image.dart';
import 'package:advanced_store_project/core/styles/font_weights.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:advanced_store_project/ui/bottom_bar/bottom_bar.dart';
import 'package:advanced_store_project/ui/bottom_bar/details/widgets/bottons_bar.dart';
import 'package:advanced_store_project/ui/bottom_bar/details/widgets/icon_custom_details.dart';
import 'package:advanced_store_project/ui/bottom_bar/details/widgets/item_name_and_price.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/items_response_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsPage extends StatelessWidget {
  final Item item;
  const DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    bool isArab = context.locale.languageCode == Languages.arabic;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
          
              height: 401,
              child: Stack(
                children: [
                  buildCategoryImage(item.item_image),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconCustomDetails(
                      icon: Icons.arrow_back,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 5,
                    child: IconCustomDetails(icon: Icons.favorite),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ItemNameAndPrice(
            name: isArab ? item.item_name_ar : item.item_name,
            price: item.item_price.toString(),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text("items.Description".tr(), style: TextStyles.font16SimiBold),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 150,
            child: Text(
              isArab ? item.item_description_ar : item.item_description,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGrey,
                fontWeight: FontWeights.semiBold,
              ),
            ),
          ),
          const Spacer(),
          ButtonsBar(
            buyNowPressed: () {
              // TODO: Implement buy now functionality
            },
            addToCartPressed: () {
              // TODO: Implement add to cart functionality
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
