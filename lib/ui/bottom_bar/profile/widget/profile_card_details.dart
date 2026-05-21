import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCardDetails extends StatelessWidget {
  final String assetImage;
  final String titleText;
  final VoidCallback onTapAction;
  const ProfileCardDetails({
    super.key,
    required this.assetImage,
    required this.titleText,
    required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAction,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          width: 343.w,
          height: 48.h,
          child: Row(
            children: [
              SvgPicture.asset(assetImage),
              SizedBox(width: 8),
              Text(titleText),
              Spacer(),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
