import 'package:ali_store/data/onboardinglist/onboarding_static.dart';
import 'package:ali_store/ui/onboardign/widget/shop_app_text.dart';
import 'package:flutter/material.dart';

class ShapeWidget extends StatelessWidget {
  final int index;
  const ShapeWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool positionUp = index != 1;
    bool isTheredPage = index == 2;

    return SizedBox(
      height: 349.16,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none, // IMPORTANT 🔥
        children: [
          Positioned(
            top: positionUp ? -21 : 0, // adjust per page
            left: 0,
            right: 0,
            child: Image.asset(
              onboardingList[index].shape!,
              // fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: isTheredPage ? null : 10,
            right: isTheredPage ? 20: null,
            top: 120,
            child: ShopAppText(isDark: positionUp, isTheredPage: isTheredPage),
          ),
        ],
      ),
    );
  }
}
