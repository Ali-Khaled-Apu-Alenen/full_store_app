import 'dart:math';

import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/functions/validate_input.dart';
import 'package:ali_store/core/networking/user_errorhandler.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/auth/login/widget/textforms.dart';
import 'package:ali_store/ui/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:ali_store/ui/auth/signup/logic/cubit/sign_up_state.dart';
import 'package:ali_store/ui/auth/signup/widget/background_signup.dart';
import 'package:ali_store/ui/auth/signup/widget/have_account_text.dart';
import 'package:ali_store/ui/auth/signup/widget/onpassword_changed.dart';
import 'package:ali_store/ui/auth/signup/widget/sign_up_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ali_store/core/di/dependency_injec.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasMinLength = _passwordController.text.length >= 6;
    final bool hasUppercase = _passwordController.text.contains(RegExp(r'[A-Z]'));
    final bool hasLowercase = _passwordController.text.contains(RegExp(r'[a-z]'));
    final bool hasNumber = _passwordController.text.contains(RegExp(r'[0-9]'));
    final bool hasSpecialChar = _passwordController.text.contains(RegExp(r'[!@#\$&*~]'));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: context.locale.languageCode == 'ar'
                  ? Matrix4.rotationY(pi) // flip horizontally
                  : Matrix4.identity(),
              child: BackgroundSignup(), // your wave/pink background
            ),
            BlocProvider(
              create: (context) => getIt<SignUpCubit>(),
              child: Builder(
                builder: (context) {
                  return BlocConsumer<SignUpCubit, SignUpState>(
                    listenWhen: (previous, current) => previous != current,
                    listener: (context, state) {
                      state.when(
                        initial: () {},
                        loading: () {
                          return Center(child: CircularProgressIndicator());
                        },
                        success: (data) {
                          AwesomeDialog(
                            dialogBackgroundColor: AppColors.primaryLoginColor,
                            // btnOkText: 'OK',
                            btnOk: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                // Navigator.pushNamedAndRemoveUntil(
                                //   context,
                                //   RoutesName.login,
                                //   (route) => false,
                                // );
                              },
                            
                              child: Text('OK'),
                            ),

                            btnOkColor: AppColors.primaryColor,
                            context: context,
                            dialogType: DialogType.success,
                            title: 'Success',
                            desc: 'Account created successfully',
                          ).show();
                        },
                        failure: (error) {
                          AwesomeDialog(
                            dialogBackgroundColor: AppColors.primaryLoginColor,
                            // btnOkText: 'OK',
                            btnOk: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                            context: context,
                            dialogType: DialogType.error,
                            title: 'Error',
                            desc: UserErrorHandler.errorMessage(error),
                          ).show();
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        orElse: () => Form(
                          key: context.read<SignUpCubit>().formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 233.h),
                              Container(
                                margin: EdgeInsets.only(left: 24.w),
                                child: Text(
                                  "signUp.Sign Up".tr(),
                                  style: TextStyles.font38MediumExtraDark,
                                ).tr(),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 24.w, right: 24.w),
                                width: 74.w,
                                height: 4.h,
                                color: AppColors.primaryLoginColor,
                              ),
                              SizedBox(height: 45.h),

                              Container(//email
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                height: 62.h,
                                child: Textforms(
                                  controller: _emailController,
                                  validator: (value) {
                                    return validateInput(value, 5, 25, "email");
                                  },
                                  isPassword: false,
                                  isOpscured: false,
                                  lableText: ("signUp.Email").tr(),
                                  imageIcon: "asset/svgs/mail_icon.svg",
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Container(//phone
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                height: 62.h,
                                child: Textforms(
                                  controller: _phoneController,
                                  validator: (value) {
                                    return validateInput(value, 5, 25, "phone");
                                  },
                                  isPassword: false,
                                  isOpscured: false,
                                  lableText: ("signUp.Phone").tr(),
                                  imageIcon: "asset/svgs/phone_icon.svg",
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Container(//password
                              
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                height: 62.h,
                                child: Textforms(
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  onTapIcon: () {
                                    togglePasswordVisibility();
                                  },
                                  controller: _passwordController,
                                  validator: (value) {
                                    return validateInput(
                                      value,
                                      8,
                                      25,
                                      "password",
                                    );
                                  },
                                  isPassword: true,
                                  isOpscured: _isPasswordVisible,
                                  lableText: ("signUp.password").tr(),
                                  imageIcon: "asset/svgs/password.svg",
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Container(//conferm password
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                height: 62.h,
                                child: Textforms(
                                
                                  onTapIcon: () {
                                    togglePasswordVisibility();
                                  },
                                  controller: _confirmPasswordController,
                                  validator: (value) {
                                    return validateInput(
                                      value,
                                      8,
                                      25,
                                      "password",
                                    );
                                  },
                                  isPassword: true,
                                  isOpscured: _isPasswordVisible,
                                  lableText: ("signUp.confirmPassword").tr(),
                                  imageIcon: "asset/svgs/password.svg",
                                ),
                              ),
                              SizedBox(height: 20.h),
                              OnpasswordChanged(
                                hasMinLength: hasMinLength,
                                hasUppercase: hasUppercase,
                                hasLowercase: hasLowercase,
                                hasNumber: hasNumber,
                                hasSpecialChar: hasSpecialChar,
                              ),
                              SizedBox(height: 20.h),
                              SignUpButton(
                                onPressed: () {
                                    if (context
                                        .read<SignUpCubit>()
                                        .formKey
                                        .currentState!
                                        .validate()) {
                                      context
                                          .read<SignUpCubit>()
                                          .emitSignUpStates(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            phone: _phoneController.text,
                                            context: context
                                          );
                                    }
                                  },
                              ),
                              SizedBox(height: 10.h),
                              HaveAccountText(),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
