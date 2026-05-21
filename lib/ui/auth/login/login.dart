import 'dart:math';

import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/di/dependency_injec.dart';
import 'package:ali_store/core/functions/validate_input.dart';
import 'package:ali_store/core/networking/user_errorhandler.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/auth/login/logic/cubit/login_cubit.dart';
import 'package:ali_store/ui/auth/login/widget/background.dart';
import 'package:ali_store/ui/auth/login/widget/login_botton.dart';
import 'package:ali_store/ui/auth/login/widget/remember_me.dart';
import 'package:ali_store/ui/auth/login/widget/textforms.dart';
import 'package:ali_store/ui/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:ali_store/ui/auth/signup/logic/cubit/sign_up_state.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = false;
    bool isRememberMe = false;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: context.locale.languageCode == 'ar'
                    ? Matrix4.rotationY(pi) // flip horizontally
                    : Matrix4.identity(),
                child: BackgroundLogin(), // your wave/pink background
              ),
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: Builder(
                  builder: (context) {
                    return BlocConsumer<LoginCubit, LoginState>(
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
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RoutesName.bottomBar,
                                    (route) => false,
                                  );
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
                          togglePassword: (passVisible) {
                            isPasswordVisible = passVisible;
                          },
                          toggleRememberMe: (isChecked) {
                            isRememberMe = isChecked;
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () =>
                              Center(child: CircularProgressIndicator()),
                          orElse: () => Form(
                            key: context.read<LoginCubit>().formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 368.h),
                                Container(
                                  margin: EdgeInsets.only(left: 24.w),
                                  child: Text(
                                    "login.Sign in",
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
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                                  height: 62.h,
                                  child: Textforms(
                                    controller: email,
                                    validator: (value) {
                                      return validateInput(value, 5, 25, "email");
                                    },
                                    isPassword: false,
                                    isOpscured: false,
                                    lableText: tr("login.Email"),
                                    imageIcon: "asset/svgs/mail_icon.svg",
                                  ),
                                ),
                                SizedBox(height: 22.h),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                                  height: 62.h,
                                  child: BlocBuilder<LoginCubit, LoginState>(
                                    builder: (context, state) {
                                      return Textforms(
                                        controller: password,
                                        validator: (value) {
                                          return validateInput(
                                            value,
                                            8,
                                            25,
                                            "password",
                                          );
                                        },
                                        isPassword: true,
                                        isOpscured: isPasswordVisible,
                                        lableText: tr("login.password"),
                                        imageIcon: "asset/svgs/password.svg",
                                        onTapIcon: () {
                                          context
                                              .read<LoginCubit>()
                                              .toggleObscurePassword();
                                          print(
                                            context
                                                .read<LoginCubit>()
                                                .obscurePassword,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
      
                                SizedBox(height: 16.h),
                                RememberMe(isChecked: isRememberMe),
                                SizedBox(height: 70.h),
                                Center(
                                  child: LoginButton(
                                    onPressed: () async {
                                      await context
                                          .read<LoginCubit>()
                                          .checkValidation();
                                      await context
                                          .read<LoginCubit>()
                                          .emitLoginState(
                                            email: email.text,
                                            password: password.text,
                                          );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("signUp.didnt have account?").tr(),
                                    InkWell(
                                      child: Text(
                                        "signUp.Sign Up",
                                        style: TextStyle(
                                          color: AppColors.primaryLoginColor,
                                          fontSize: 14,
                                        ),
                                      ).tr(),
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          RoutesName.sign,
                                        );
                                      },
                                    ),
                                  ],
                                ),
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
      ),
    );
  }
}
