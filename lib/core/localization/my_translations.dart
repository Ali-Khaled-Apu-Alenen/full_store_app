import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/services/shared_preferences_helper.dart';

getTranslations(){
  final language = SharedPreferencesHelper.getString(Languages.languageKey);
  if (language == Languages.arabic) {
    return {
      'hello': 'مرحبا',
    };
  } else {
    return {
      'hello': 'Hello',
    };
  }
}
