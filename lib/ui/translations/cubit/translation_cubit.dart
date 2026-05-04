import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/services/shared_preferences_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());

  void changeLanguage(BuildContext context, String language) {
    if (language == Languages.arabic) {
      context.setLocale(Locale(Languages.arabic));
      emit(TranslationArabic());
      
      SharedPreferencesHelper.setData(Languages.languageKey, Languages.arabic);
    } else {
      context.setLocale(Locale(Languages.english));
      emit(TranslationEnglish());
      SharedPreferencesHelper.setData(Languages.languageKey, Languages.english);
    }
  }
}
