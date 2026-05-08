import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDiscount extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final bool isImageAsset;
  final String link;
  const CardDiscount({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.isImageAsset, required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      padding: EdgeInsets.only(left: 10.w, right: 10.w),

      decoration: BoxDecoration(
        color: HomeColors.primaryColor,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text1, style: TextStyles.font14SimiBoldWhite).tr(),
              SizedBox(height: 2.h),
              Text(text2, style: TextStyles.font16BoldWhite).tr(),
              SizedBox(height: 2.h),
              Text(text3, style: TextStyles.font14SimiBoldWhite).tr(),
            ],
          ),
          Spacer(),
          isImageAsset 
            ? Image.asset(
                link,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image, color: Colors.white, size: 40);
                },
              )
            : Image.network(
                link,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image, color: Colors.white, size: 40);
                },
              ),
        ],
      ),
    );
  }
}
