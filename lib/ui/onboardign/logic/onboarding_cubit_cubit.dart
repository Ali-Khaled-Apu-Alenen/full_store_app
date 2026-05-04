import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/constatnt/shared_pref_keys.dart';
import 'package:ali_store/core/routes/navigation_extentions.dart';
import 'package:ali_store/core/services/shared_preferences_helper.dart';
import 'package:ali_store/data/onboardinglist/onboarding_static.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_cubit_state.dart';

class OnboardingCubitCubit extends Cubit<OnboardingCubitState> {
  OnboardingCubitCubit() : super(OnboardingCubitInitial()) {
    initController();
  }
  
  late PageController pageController;

  int index = 0;
  String buttonText = "Continue";
  void onboardingIndexState() {
    if (index < onboardingList.length - 1) {
      SharedPreferencesHelper.setData(SharedPrefKeys.onBoardingKey, false);
      buttonText = "Continue";
    } else {
      buttonText = "Get Started";
    }
    emit(OnboardingIndexState(index));
  }

  void nextIndex(BuildContext context) async{
    if (index < onboardingList.length - 1) {
      index++;
      onboardingIndexState();
    }
     else {
    await SharedPreferencesHelper.setData(
      SharedPrefKeys.onBoardingKey,
      true,
    );

    if (context.mounted) {
      context.pushReplacementNamedPage(RoutesName.translation);
    }
  }

    
  }

  void dispose() {
    pageController.dispose();
  }

  void initController() {
    pageController = PageController(initialPage: index);
  }

  void changePage() {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
