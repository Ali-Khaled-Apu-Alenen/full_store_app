import 'package:flutter/material.dart';
import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/styles/font_weights.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static const TextStyle font14SimiBoldBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.semiBold,
  );
  static const TextStyle font14SimiBoldWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.semiBold,
    color: AppColors.white,
  );
  static const TextStyle font16BoldWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.bold,
    color: AppColors.white,
    
  );
  static const TextStyle font14RegularWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.regular,
    color: AppColors.white,
    
  );
  static const TextStyle font16Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.medium,
  );
  static const TextStyle font16SimiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.semiBold,
  );
  static const TextStyle font20SimiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeights.semiBold,
  );
  static const TextStyle font16SimiBoldPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.semiBold,
    color: HomeColors.primaryColor,
  );
  static const TextStyle font14RegularDarkGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.regular,
    color: AppColors.darkGrey,
  );
  static const TextStyle font38MediumExtraDark = TextStyle(
    fontSize: 38,
    fontWeight: FontWeights.medium,
    color: AppColors.extraDarkGrey,
  );
  static const TextStyle font24MediumExtraDark = TextStyle(
    fontSize: 24,
    fontWeight: FontWeights.medium,
    color: AppColors.extraDarkGrey,
  );
  static const TextStyle font28BoldWhite = TextStyle(
    fontSize: 28,
    fontWeight: FontWeights.bold,
    color: AppColors.white,
  );
  static const TextStyle font28BoldPrimary = TextStyle(
    fontSize: 28,
    fontWeight: FontWeights.bold,
    color: AppColors.primaryColor,
  );
}

class AppThemes {
  static ThemeData getTheme(Locale locale) {
    final isArabic = locale.languageCode == 'ar';
    return ThemeData(
      textTheme: isArabic
          ? GoogleFonts.fustatTextTheme()
          : GoogleFonts.playfairDisplayTextTheme(),
      // your other shared theme settings (colors, etc.)
    );
  }
}
