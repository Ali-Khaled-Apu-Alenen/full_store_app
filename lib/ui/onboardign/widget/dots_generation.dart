import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/data/onboardinglist/onboarding_static.dart';
import 'package:advanced_store_project/ui/onboardign/logic/onboarding_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                width: index == currentIndex ? 20 : 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: index == currentIndex
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(0.3),
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
