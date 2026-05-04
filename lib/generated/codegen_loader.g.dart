// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "hello": "مرحبا",
  "Sign Up": "إنشاء حساب",
  "Choose Language": "اختر اللغة",
  "English": "الانجليزية",
  "Arabic": "العربية",
  "Continue": "متابعة",
  "validate": {
    "InputLength": "القيمة يجب أن تكون بين {min} و {max} حرف",
    "Invalid email": "البريد الالكتروني غير صحيح",
    "Invalid password": "كلمة المرور غير صحيحة",
    "Invalid phone": "رقم الهاتف غير صحيح"
  },
  "login": {
    "Sign in": "تسجيل الدخول",
    "Email": "البريد الالكتروني",
    "password": "كلمة المرور",
    "Login": "تسجيل الدخول",
    "Remember me": " تذكرني ",
    "Forgot password?": "نسيت كلمه المرور؟"
  },
  "signUp": {
    "Sign Up": "إنشاء حساب",
    "Phone": "رقم الهاتف",
    "Email": "البريد الالكتروني",
    "password": "كلمة المرور",
    "confirmPassword": "تأكيد كلمة المرور"
  },
  "forgetPassword": {
    "Forget Password": "نسيت كلمة المرور",
    "Enter Your Email": "أدخل بريدك الإلكتروني",
    "Reset Password": "لإعادة تعيين كلمة المرور،\n يرجى إدخال بريدك الإلكتروني.",
    "Email not found": "البريد الإلكتروني غير موجود"
  },
  "checkCode": {
    "Check Your Email": "تحقق من بريدك الإلكتروني",
    "Verify incorrect": "رمز التحقق غير صحيح",
    "wrong code": "رمز خاطئ",
    "Code Sent": "لقد أرسلنا إليك بريدًا إلكترونيًا يحتوي على رمز لإعادة تعيين كلمة المرور"
  },
  "resetPassword": {
    "Reset Password": "إعادة تعيين كلمة المرور",
    "Enter Your Password": "أدخل كلمة المرور الجديدة",
    "confirmPassword": "تأكيد كلمة المرور الجديدة"
  },
  "home": {
    "hello": "مرحبا",
    "featured": "مميز",
    "see all": "عرض الكل",
    "most popular": "الأكثر شعبية",
    "Search": "بحث",
    "cardview": {
      "Get Winter Discount": "خصم شتوي",
      "20% OFF": "20% خصم",
      "for children": "للأطفال",
      "Discount for electronics": "خصم للإلكترونيات",
      "30% OFF": "30% خصم",
      "for electronics": "للإلكترونيات",
      "Fast Delevery Food": "توصيل سريع للطعام",
      "Free shipping": "شحن مجاني",
      "Delivery": "توصيل"
    }
  },
  "items": {
    "Products": "المنتجات",
    "Error": "خطأ",
    "No items found in this category": "لا توجد منتجات في هذه الفئة",
    "NO Internet Connection": "لا يوجد اتصال بالإنترنت",
    "Description": "الوصف",
    "Buy Now": "اشترِ الآن",
    "Start searching...": "ابدأ البحث...",
    "No items found": "لا توجد منتجات",
    "Results for:": "نتائج البحث عن: {}",
    "items": "منتجات"
  }
};
static const Map<String,dynamic> _en = {
  "hello": "hello",
  "Sign Up": "Sign Up",
  "Choose Language": "Choose Language",
  "English": "English",
  "Arabic": "Arabic",
  "Continue": "Continue",
  "validate": {
    "Invalid phone": "Invalid phone",
    "Invalid email": "Invalid email",
    "Invalid password": "Invalid password",
    "InputLength": "Input must be between {min} and {max} characters"
  },
  "login": {
    "Sign in": "Sign in",
    "Email": "Email",
    "password": "password",
    "Login": "Login",
    "Remember me": "Remember me",
    "Forgot password?": "Forget password?"
  },
  "signUp": {
    "Sign Up": "Sign Up",
    "Phone": "Phone",
    "Email": "Email",
    "password": "password",
    "confirmPassword": "confirmPassword"
  },
  "forgetPassword": {
    "Forget Password": "Forget Password",
    "Enter Your Email": "Enter Your Email",
    "Reset Password": "To reset your password,\n please enter your email address.",
    "Email not found": "Email not found"
  },
  "checkCode": {
    "Check Your Email": "Check Your Email",
    "Verify incorrect": "Verify code is incorrect",
    "wrong code": "Wrong code",
    "Code Sent": "We've sent you an email with a code to reset your password"
  },
  "resetPassword": {
    "Reset Password": "Reset Password",
    "Enter Your Password": "Enter Your New Password",
    "confirmPassword": "confirm New Password"
  },
  "home": {
    "hello": "hello",
    "featured": "Featured",
    "see all": "See all",
    "most popular": "Most Popular",
    "Search": "Search",
    "cardview": {
      "Get Winter Discount": "Get Winter Discount",
      "20% OFF": "20% OFF",
      "for children": "for children",
      "Discount for electronics": "Discount for electronics",
      "30% OFF": "30% OFF",
      "for electronics": "for electronics",
      "Fast Delevery Food": "Fast Delevery Food",
      "Free shipping": "Free shipping",
      "Delivery": "Delivery"
    }
  },
  "items": {
    "Products": "Products",
    "Error": "Error",
    "No items found in this category": "No items found in this category",
    "NO Internet Connection": "NO Internet Connection",
    "Description": "Description",
    "Start searching...": "Start searching...",
    "No items found": "No items found",
    "Results for:": "Results for: {}"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
