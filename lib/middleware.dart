import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';

import 'package:ali_store/core/constatnt/shared_pref_keys.dart';

import 'package:ali_store/core/services/shared_preferences_helper.dart';

import 'package:flutter/widgets.dart';



class Middleware {

  

  static Future<bool> isLoggedIn() async {
      final int? userData = await SharedPreferencesHelper.getInt(SharedPrefKeys.userDataKey);
      final bool? isLoggedIn = await SharedPreferencesHelper.getBool(SharedPrefKeys.isLoggedInKey);
       return isLoggedIn==true&&userData!=null;
    



  }

  static Future<bool> setSaveLoggin() async {
      
    return await SharedPreferencesHelper.getBool(SharedPrefKeys.rememberMeKey) ?? false;


  }
  static Future<String?> isSetLanguage() async {
    return await SharedPreferencesHelper.getString(Languages.languageKey);
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
      final language = await isSetLanguage();
      
      if(language == null) {
        return RoutesName.translation;
      }

      if (isLogged && isRememberMe) {

        return RoutesName.bottomBar;

      } else {

        return RoutesName.login;

      }

    } else {

      return RoutesName.onboarding;

    }

  }

}

