import 'package:advanced_store_project/core/constatnt/routes_name.dart';

import 'package:advanced_store_project/core/constatnt/shared_pref_keys.dart';

import 'package:advanced_store_project/core/services/shared_preferences_helper.dart';

import 'package:flutter/widgets.dart';



class Middleware {

  

  static Future<bool> isLoggedIn() async {

    return await SharedPreferencesHelper.getBool(SharedPrefKeys.isLoggedInKey) ?? false;



  }

  static Future<bool> setSaveLoggin() async {

    return await SharedPreferencesHelper.getBool(SharedPrefKeys.rememberMeKey) ?? false;

  }

  static Future<void> clearLoginData() async {

    await SharedPreferencesHelper.removeData(SharedPrefKeys.rememberMeKey);

    await SharedPreferencesHelper.removeData(SharedPrefKeys.isLoggedInKey);

  }

  static Future<bool> onBoardingFinished() async {

    return await SharedPreferencesHelper.getBool(SharedPrefKeys.onBoardingKey) ?? false;

  }

  static Future<String> setUserPhase() async {

    bool isLogged = await isLoggedIn();

    bool isRememberMe = await setSaveLoggin();

    bool isOnBoardingFinished = await onBoardingFinished();

    if (isOnBoardingFinished) {

      if (isLogged && isRememberMe) {

        return RoutesName.home;

      } else {

        return RoutesName.login;

      }

    } else {

      return RoutesName.onboarding;

    }

  }

}

