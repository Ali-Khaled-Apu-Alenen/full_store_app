import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarNotificationIcon extends StatelessWidget {
  const AppBarNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: HomeColors.lightGrey,
            borderRadius: BorderRadius.circular(30)),
          child: Icon(Icons.person),
        ),
        SizedBox(width: 8.w),
        Column(
          children: [
            Text("home.hello".tr()).tr(),
            Text("welcome_back".tr(), style: TextStyles.font14SimiBoldBlack),
          ],
        ),
        SizedBox(width: 8.w),
        Spacer(),
        Container(
          width: 48.w,
          height: 48.h,

          decoration: BoxDecoration(
            color: HomeColors.lightGrey,
            borderRadius: BorderRadius.circular(100)),
          child: Icon(Icons.notifications),
        ),
      ],
    );
  }
}
