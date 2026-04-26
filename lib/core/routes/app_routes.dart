import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/networking/api_services.dart';
import 'package:advanced_store_project/ui/auth/login/logic/cubit/login_cubit.dart';
import 'package:advanced_store_project/ui/auth/login/login.dart';
import 'package:advanced_store_project/ui/auth/login/password_auth/password_auth_wrapper.dart';
import 'package:advanced_store_project/ui/home/home.dart';
import 'package:advanced_store_project/ui/home/widget/home_pages_wrapper.dart';
import 'package:advanced_store_project/ui/onboardign/logic/onboarding_cubit_cubit.dart';
import 'package:advanced_store_project/ui/onboardign/onboarding.dart';
import 'package:advanced_store_project/ui/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_store_project/ui/auth/signup/sign_up.dart';
import 'package:advanced_store_project/ui/auth/signup/verifycode/check_code.dart';
import 'package:advanced_store_project/ui/auth/signup/verifycode/cubit/verify_code_cubit.dart';
import 'package:advanced_store_project/ui/auth/signup/verifycode/model/repo/verify_code_repo.dart';
import 'package:advanced_store_project/ui/translations/cubit/translation_cubit.dart';
import 'package:advanced_store_project/ui/translations/translation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic> onboardingRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => OnboardingCubitCubit(),
            child: Onboarding(),
          ),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case RoutesName.sign:
        return MaterialPageRoute(builder: (_) => SignUp());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => HomePagesWrapper(initialRoute: RoutesName.home));
      case RoutesName.translation:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => TranslationCubit(),
            child: TranslationPage(),
          ),
        );

      case RoutesName.forgotPassword:
        return MaterialPageRoute(builder: (context) => PasswordAuthWrapper(initialRoute: RoutesName.forgotPassword));
      case RoutesName.checkCode:
        final email = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => CheckCode(email: email ?? ''));
      case RoutesName.resetPassword:
        return MaterialPageRoute(builder: (context) => PasswordAuthWrapper(initialRoute: RoutesName.resetPassword));
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: Text("Error")));
    }
  }

  // static Route<dynamic> homeRoute(){
  //   return MaterialPageRoute(builder: (context) => Home());
  // }
}
