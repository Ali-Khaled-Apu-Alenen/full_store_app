import 'package:ali_store/core/constatnt/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLoginColor,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        minimumSize: Size(343, 49),
      ),
      onPressed: onPressed,
      child: Text("login.Login").tr(),
    );
  }
}
