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
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ali_store/core/di/dependency_injec.dart';

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
                              SizedBox(height: 233),
                              Container(
                                margin: EdgeInsets.only(left: 24),
                                child: Text(
                                  "signUp.Sign Up".tr(),
                                  style: TextStyles.font38MediumExtraDark,
                                ).tr(),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 24, right: 24),
                                width: 74,
                                height: 4,
                                color: AppColors.primaryLoginColor,
                              ),
                              SizedBox(height: 45),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                height: 62,
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
                              SizedBox(height: 12),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                height: 62,
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
                              SizedBox(height: 12),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                height: 62,
                                child: Textforms(
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
                              SizedBox(height: 12),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                height: 62,
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
                              SizedBox(height: 100),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.primaryLoginColor,
                                    foregroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    minimumSize: Size(343, 49),
                                  ),
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
                                  child: Text("signUp.Sign Up").tr(),
                                ),
                              ),
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
