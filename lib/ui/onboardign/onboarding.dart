import 'package:advanced_store_project/ui/onboardign/widget/button_onboarding.dart';
import 'package:advanced_store_project/ui/onboardign/widget/dots_generation.dart';
import 'package:advanced_store_project/ui/onboardign/widget/page_view_builder_onboarding.dart';
import 'package:flutter/material.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(

          children: [
          PageViewBuilderOnboarding(),
          DotsGeneration(),
          SizedBox(height: 20,),
          ButtonOnboarding(),
        SizedBox(height: 50,),
          ],
        ),
      );
  }
}
