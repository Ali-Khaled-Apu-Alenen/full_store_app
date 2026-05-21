import 'package:ali_store/ui/onboardign/widget/button_onboarding.dart';
import 'package:ali_store/ui/onboardign/widget/dots_generation.dart';
import 'package:ali_store/ui/onboardign/widget/page_view_builder_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(

          children: [
          PageViewBuilderOnboarding(),
          DotsGeneration(),
          SizedBox(height: 10.h),
          ButtonOnboarding(),
        SizedBox(height: 30.h),
          ],
        ),
      );
  }
}
