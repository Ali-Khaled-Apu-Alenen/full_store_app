import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textforms extends StatelessWidget {
  final bool isOpscured;
  final String lableText;
  final String imageIcon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTapIcon;
  final Function(String)? onChanged;
  const Textforms({
    super.key,
    required this.isOpscured,
    required this.lableText,
    required this.imageIcon,
    required this.isPassword,
    required this.controller,
    this.validator, this.onTapIcon, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      obscureText: isOpscured,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryLoginColor,
            width: 1.5.w,
          ),
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryLoginColor,
            width: 1.5.w,
          ),
        ),
        prefix: Row(
            mainAxisSize: MainAxisSize.min,
            children: [SvgPicture.asset(imageIcon), Text(" | ")],
          ),
        
        labelText: lableText,
        labelStyle: TextStyles.font16Medium,
        suffix:
                  InkWell(
                    onTap: onTapIcon,
                    child: Icon(
                      isPassword?isOpscured?Icons.visibility_off_outlined:Icons.visibility_outlined:null,
                        size: 24.w,
                        color: AppColors.darkGrey,
                      ),
                  )
                
      ),
    );
  }
}
