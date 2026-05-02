import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonsBar extends StatelessWidget {
  final void Function()? buyNowPressed;
  final void Function()? addToCartPressed;
  const ButtonsBar({
    super.key,
    this.buyNowPressed,
    this.addToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            backgroundColor: WidgetStatePropertyAll(HomeColors.primaryColor),
            minimumSize: WidgetStatePropertyAll(Size(245, 48)),
          ),
          onPressed: buyNowPressed,
          child: Text("items.Buy Now".tr(), style: TextStyle(color: Colors.white)),
        ),
        SizedBox(width: 8),
        IconButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            backgroundColor: WidgetStatePropertyAll(HomeColors.lightGrey),
            minimumSize: WidgetStatePropertyAll(Size(90, 48)),
          ),
          onPressed: addToCartPressed,
          icon: SvgPicture.asset("asset/svgs/shipping.svg"),
        ),
      ],
    );
  }
}
