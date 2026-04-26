part of 'onboarding_cubit_cubit.dart';

@immutable
sealed class OnboardingCubitState {}

final class OnboardingCubitInitial extends OnboardingCubitState {}

final class OnboardingIndexState extends OnboardingCubitState {
  final int index;
  OnboardingIndexState(this.index);
}

final class OnBoardingFinshedState extends OnboardingCubitState {
  OnBoardingFinshedState();
}
