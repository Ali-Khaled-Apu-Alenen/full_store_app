import 'package:advanced_store_project/data/onboardinglist/onboarding_static.dart';
import 'package:advanced_store_project/ui/onboardign/logic/onboarding_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(onboardingList[index].title!),
                  SizedBox(height: 20),
                  Text(onboardingList[index].description!),
                  SizedBox(height: 20),
                  Image.asset(onboardingList[index].image!),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
