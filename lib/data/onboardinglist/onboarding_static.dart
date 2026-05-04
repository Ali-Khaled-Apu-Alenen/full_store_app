import 'package:ali_store/core/constatnt/image_Assets.dart';
import 'package:ali_store/data/onboardinglist/onboarding_model.dart';

List<OnboardingModel> onboardingList = [
  
  OnboardingModel(
    title: "Purchase Online !!",
    description: "Online shopping is easy and secure",
    image: ImageAsset.imageOne,
    shape: ImageAsset.shapeOne,
  ),
  OnboardingModel(
    title: "Track order !!",
    description: "Track your order in real time",
    image: ImageAsset.imageTwo,
    shape: ImageAsset.shapeTwo,
  ),
  OnboardingModel(
    title: "Get your order !!",
    description: "Get your order delivered to your door",
    image: ImageAsset.imageTree,
    shape: ImageAsset.shapeThree,
  ),
  // OnboardingModel(
  //   title: "online save your progress",
  //   description: "you can save your progress online and continue later \n and your height score will be saved too",
  //   image: ImageAsset.imageFour,
  // ),
];
