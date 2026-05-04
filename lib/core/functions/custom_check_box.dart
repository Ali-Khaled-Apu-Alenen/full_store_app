import 'package:ali_store/core/constatnt/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final VoidCallback onTap;
  final bool isChecked;
  const CustomCheckBox({Key? key, required this.onTap, required this.isChecked}) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
    
        height:22,
        width: 22,
        decoration: BoxDecoration(
          // color: isChecked ? AppColors.primaryLoginColor : Colors.transparent,
          border: Border.all(color: widget.isChecked ? AppColors.primaryLoginColor : Colors.grey,width:  2),
          borderRadius: BorderRadius.circular(6),
        ),
        child:  Container(
          margin: const EdgeInsets.all(2), // 👈 this creates the white gap
          decoration: BoxDecoration(
            color: widget.isChecked ? AppColors.primaryLoginColor : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
