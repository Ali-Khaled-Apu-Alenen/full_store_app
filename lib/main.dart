import 'dart:ui' as ui;

import 'package:advanced_store_project/core/constatnt/languages.dart';
import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/routes/app_routes.dart';
import 'package:advanced_store_project/core/di/dependency_injec.dart';
import 'package:advanced_store_project/core/services/shared_preferences_helper.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:advanced_store_project/middleware.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await setupGetIt();
  final deviceLocale =
      ui.PlatformDispatcher.instance.locale.toString() == "en_US" ? "en" : "ar";
  final savedLocale = await SharedPreferencesHelper.getString(
    Languages.languageKey,
  );
  final initLocal = savedLocale != null
      ? Locale(savedLocale)
      : Locale(deviceLocale);
  bool checkOnBoarding = await Middleware.onBoardingFinished();
  final initPage = await Middleware.setUserPhase();

  runApp(
    EasyLocalization(
      path: 'asset/translations',
      supportedLocales: const [Locale('en'), Locale('ar')],
      startLocale: initLocal,
      child: MyApp(checkOnBoarding: checkOnBoarding, initPage: initPage),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool checkOnBoarding;
  final String initPage;
  const MyApp({
    super.key,
    required this.checkOnBoarding,
    required this.initPage,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      theme: AppThemes.getTheme(context.locale),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      onGenerateRoute: AppRoutes.onboardingRoute,
      initialRoute: RoutesName.bottomBar,
    );
  }
}

//  checkOnBoarding ? RoutesName.login : RoutesName.onboarding,
