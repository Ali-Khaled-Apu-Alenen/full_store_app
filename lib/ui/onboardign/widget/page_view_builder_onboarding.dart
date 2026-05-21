import 'package:ali_store/data/onboardinglist/onboarding_static.dart';
import 'package:ali_store/ui/onboardign/logic/onboarding_cubit_cubit.dart';
import 'package:ali_store/ui/onboardign/widget/shape_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewBuilderOnboarding extends StatefulWidget {
  const PageViewBuilderOnboarding({Key? key}) : super(key: key);

  @override
  _PageViewBuilderOnboardingState createState() =>
      _PageViewBuilderOnboardingState();
}

class _PageViewBuilderOnboardingState extends State<PageViewBuilderOnboarding> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubitCubit, OnboardingCubitState>(
      builder: (context, state) {
        final cubit = context.read<OnboardingCubitCubit>();
        return Expanded(
          flex: 3,
          child: PageView.builder(
            controller: cubit.pageController,
            onPageChanged: (index) {
              cubit.index = index;
              cubit.onboardingIndexState();
            },
            itemCount: onboardingList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShapeWidget(index: index),
                  Center(child: Image.asset(onboardingList[index].image!,width: 280.w,height: 345.h,)),
                  // SizedBox(height: 20),
                  // Text(onboardingList[index].title!),
                  // Text(onboardingList[index].description!),
                  SizedBox(height: 20.h),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
