import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizePick extends StatelessWidget {
  const SizePick({super.key, required this.sizes});
  final List<String> sizes;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("   Size   ", style: TextStyles.font16SimiBold),
        CustomRadioButton(
          enableButtonWrap: true,
          // margin: EdgeInsets.only(left: 10),
          shapeRadius: 10,
          width: 54.w,
          height: 44.h,
          enableShape: true,
          padding: 5,
          // spacing: 5,
          elevation: 1,
          absoluteZeroSpacing: false,
          unSelectedColor: HomeColors.lightGrey,
          buttonLables: sizes,
          buttonValues: sizes,
          disabledValues: [sizes[3]],
          buttonTextStyle: ButtonTextStyle(
            selectedColor: Colors.white,
            unSelectedColor: Colors.black,
            textStyle: TextStyles.font14SimiBoldBlack,
          ),
          radioButtonValue: (value) {
            print(value);
          },
          selectedColor: HomeColors.primaryColor,
        ),
      ],
    );
  }
}
//       CustomCheckBoxGroup(
//   buttonTextStyle: ButtonTextStyle(
//     selectedColor: Colors.red,
//     unSelectedColor: Colors.orange,
    
//     textStyle: TextStyle(
//       fontSize: 16,
//     ),
//     selectedTextStyle: TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w700,
//     ),
//   ),
//   unSelectedColor: Theme.of(context).canvasColor,
//   buttonLables: sizes,
//   ,
//   buttonValuesList: sizes,
//   checkBoxButtonValues: (values) {
//     print(values);
//   },
//   spacing: 0,
//   // defaultSelected: "Monday",
//   horizontal: false,
//   enableButtonWrap: false,
//   width: 40,
//   absoluteZeroSpacing: false,
//   selectedColor: AppColors.primaryColor,
//   padding: 10, 
// );