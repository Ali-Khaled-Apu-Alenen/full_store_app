import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/routes/app_routes.dart';
import 'package:advanced_store_project/core/routes/navigation_extentions.dart';
import 'package:advanced_store_project/ui/onboardign/logic/onboarding_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonOnboarding extends StatelessWidget {
  const ButtonOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 60,
      child: BlocBuilder<OnboardingCubitCubit, OnboardingCubitState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubitCubit>();
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
              // padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 200)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            onPressed: () {
              cubit.nextIndex(context);
              cubit.changePage();
            },
            child: Text(cubit.buttonText),
          );
        },
      ),
    );
  }
}
