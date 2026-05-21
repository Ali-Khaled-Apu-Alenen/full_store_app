import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/data/onboardinglist/onboarding_static.dart';
import 'package:ali_store/ui/onboardign/logic/onboarding_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsGeneration extends StatefulWidget {
  DotsGeneration({Key? key}) : super(key: key);

  @override
  _DotsGenerationState createState() => _DotsGenerationState();
}

class _DotsGenerationState extends State<DotsGeneration> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubitCubit, OnboardingCubitState>(
      builder: (context, state) {
        final currentIndex = state is OnboardingIndexState ? state.index : 0;
        context.read<OnboardingCubitCubit>();
        
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(onboardingList.length, (index) {
              // print(cubit.index);
              return AnimatedContainer(
                width: index == currentIndex ? 20.w : 6.w,
                height: 6.h,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: index == currentIndex
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }),
          ],
        );
      },
    );
  }
}
