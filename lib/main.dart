import 'dart:ui' as ui;
import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/routes/app_routes.dart';
import 'package:ali_store/core/di/dependency_injec.dart';
import 'package:ali_store/core/services/shared_preferences_helper.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/middleware.dart';
import 'package:ali_store/ui/auth/login/login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyBuqfnvKcOOzTJZW1TfAGj0TMDJbvtZpNs",
    //   authDomain: "advanced-store-4419e.firebaseapp.com",
    //   projectId: "advanced-store-4419e",
    //   storageBucket: "advanced-store-4419e.firebasestorage.app",
    //   messagingSenderId: "247168341628",
    //   appId: "1:247168341628:web:fc0fca81d365a563a91bf9",
    //   measurementId: "G-GV676CV2NM",
    // ),
  );
  await setupGetIt();
  // final deviceLocale =
  //     ui.PlatformDispatcher.instance.locale.toString() == "en_US" ? "en" : "ar";
  final savedLocale = await SharedPreferencesHelper.getString(
    Languages.languageKey,
  );
  final initLocal = savedLocale != null ? Locale(savedLocale) : Locale("en");
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
  }); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          theme: AppThemes.getTheme(context.locale),
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          onGenerateRoute: AppRoutes.onboardingRoute,
          initialRoute: initPage,
        );
      },
    );
  }
}

//  checkOnBoarding ? RoutesName.login : RoutesName.onboarding,
