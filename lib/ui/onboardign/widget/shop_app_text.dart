import 'package:ali_store/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopAppText extends StatelessWidget {
  final bool isTheredPage;
  final bool isDark;
  const ShopAppText({super.key, required this.isDark, required this.isTheredPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isTheredPage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(isDark ?  "asset/svgs/shop.svg":"asset/svgs/shop_blue.svg"),
        Text("eCommerce shop",style: isDark ? TextStyles.font28BoldWhite : TextStyles.font28BoldPrimary,),
        Container(
          height: 1,
          width: 233,
          color: isDark ? Colors.white : Colors.black,
        ),
        Text("Professional App for your\neCommerce business",style: isDark ? TextStyles.font14RegularWhite : TextStyles.font14RegularDarkGrey,),
      ],
    );
  }
}
