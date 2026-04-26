import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class Textforms extends StatelessWidget {
  final bool isOpscured;
  final String lableText;
  final String imageIcon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTapIcon;
  const Textforms({
    super.key,
    required this.isOpscured,
    required this.lableText,
    required this.imageIcon,
    required this.isPassword,
    required this.controller,
    this.validator, this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isOpscured,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryLoginColor,
            width: 1.5,
          ),
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryLoginColor,
            width: 1.5,
          ),
        ),
        prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [SvgPicture.asset(imageIcon), Text("|")],
          ),
        
        labelText: lableText,
        labelStyle: TextStyles.font16Medium,
        suffixIcon:
                  InkWell(
                    onTap: onTapIcon,
                    child: Icon(
                      isPassword?isOpscured?Icons.visibility_off_outlined:Icons.visibility_outlined:null,
                        size: 24,
                        color: AppColors.darkGrey,
                      ),
                  )
                
      ),
    );
  }
}
