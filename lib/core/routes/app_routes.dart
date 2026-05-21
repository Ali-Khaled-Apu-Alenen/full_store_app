import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/di/dependency_injec.dart';
import 'package:ali_store/core/networking/api_services.dart';
import 'package:ali_store/ui/auth/login/logic/cubit/login_cubit.dart';
import 'package:ali_store/ui/auth/login/login.dart';
import 'package:ali_store/ui/auth/login/password_auth/password_auth_wrapper.dart';
import 'package:ali_store/ui/auth/signup/widget/verify_code_test_details.dart';
import 'package:ali_store/ui/bottom_bar/bottom_bar.dart';
import 'package:ali_store/ui/bottom_bar/details/details_page.dart';
import 'package:ali_store/data/model/items_response_data.dart';
import 'package:ali_store/ui/bottom_bar/logic/cubit/bottom_bar_cubit.dart';
import 'package:ali_store/ui/bottom_bar/home/home.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/items_page/items_page.dart';
import 'package:ali_store/ui/bottom_bar/profile/profile.dart';
import 'package:ali_store/ui/bottom_bar/profile/setting/setting.dart';
import 'package:ali_store/ui/onboardign/logic/onboarding_cubit_cubit.dart';
import 'package:ali_store/ui/onboardign/onboarding.dart';
import 'package:ali_store/ui/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:ali_store/ui/auth/signup/sign_up.dart';
import 'package:ali_store/ui/auth/signup/verifycode/check_code.dart';
import 'package:ali_store/ui/auth/signup/verifycode/cubit/verify_code_cubit.dart';
import 'package:ali_store/ui/auth/signup/verifycode/model/repo/verify_code_repo.dart';
import 'package:ali_store/ui/bottom_bar/search/logic/cubit/search_cubit.dart';
import 'package:ali_store/ui/bottom_bar/search/search_page.dart';
import 'package:ali_store/ui/translations/cubit/translation_cubit.dart';
import 'package:ali_store/ui/translations/translation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic> onboardingRoute(RouteSettings settings) {
    switch (settings.name) {
      //onboarding
      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => OnboardingCubitCubit(),
            child: Onboarding(),
          ),
        );
      //===============auth===============
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => Login());
      case RoutesName.sign:
        return MaterialPageRoute(builder: (_) => SignUp());
      case RoutesName.forgotPassword:
        return MaterialPageRoute(
          builder: (context) =>
              PasswordAuthWrapper(initialRoute: RoutesName.forgotPassword),
        );
      case RoutesName.checkCode:
        final args = settings.arguments as List;
        return MaterialPageRoute(
          builder: (context) => CheckCode(email: args[0], verifyCode: args[1]),
        );
      case RoutesName.resetPassword:
        return MaterialPageRoute(
          builder: (context) =>
              PasswordAuthWrapper(initialRoute: RoutesName.resetPassword),
        );
      case RoutesName.verifyCodeTestDetails:
        return MaterialPageRoute(builder: (_) => VerifyCodeTestDetails());
      //===============app pages===============
      case RoutesName.bottomBar:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => BottomBarCubit(), child: BottomBar()),
        );
      case RoutesName.items:
        final categoryId = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeBloc>(),
            child: ItemsPage(categoryId: categoryId ?? 0),
          ),
        );
      case RoutesName.search:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: SearchPage(),
          ),
        );
      case RoutesName.profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case RoutesName.setting:
        return MaterialPageRoute(builder: (_) => Setting());
      //===============Localization===============
      case RoutesName.translation:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => TranslationCubit(),
            child: TranslationPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Center(child: Text("not found")),
        );
    }
  }

  // static Route<dynamic> homeRoute(){
  //   return MaterialPageRoute(builder: (context) => Home());
  // }
}
