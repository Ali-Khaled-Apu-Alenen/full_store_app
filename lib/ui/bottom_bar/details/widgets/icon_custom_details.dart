import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:flutter/material.dart';

class IconCustomDetails extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  const IconCustomDetails({
    super.key,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(40),
        ),
        width: 48,
        height: 48,
        child: Icon(icon),
      ),
    );
  }
}
