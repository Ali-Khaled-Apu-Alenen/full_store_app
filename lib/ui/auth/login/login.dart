import 'dart:math';

import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/di/dependency_injec.dart';
import 'package:advanced_store_project/core/functions/validate_input.dart';
import 'package:advanced_store_project/core/networking/user_errorhandler.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:advanced_store_project/ui/auth/login/logic/cubit/login_cubit.dart';
import 'package:advanced_store_project/ui/auth/login/widget/background.dart';
import 'package:advanced_store_project/ui/auth/login/widget/remember_me.dart';
import 'package:advanced_store_project/ui/auth/login/widget/textforms.dart';
import 'package:advanced_store_project/ui/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_store_project/ui/auth/signup/logic/cubit/sign_up_state.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesName.home,
                            (route) => false,
                          );
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
                        }, togglePassword: () {  }, toggleRememberMe: () {  },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        orElse: () =>  Form(
              key: context.read<LoginCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 368),
                  Container(
                    margin: EdgeInsets.only(left: 24),
                    child: Text(
                      "login.Sign in",
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
                  SizedBox(height: 22),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    height: 62,
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Textforms(
                          controller: password,
                          validator: (value) {
                            return validateInput(value, 8, 25, "password");
                          },
                          isPassword: true,
                          isOpscured: context
                              .read<LoginCubit>()
                              .obscurePassword,
                          lableText: tr("login.password"),
                          imageIcon: "asset/svgs/password.svg",
                          onTapIcon: () {
                            context.read<LoginCubit>().toggleObscurePassword();
                            print(context.read<LoginCubit>().obscurePassword);
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 16),
                  RememberMe(),
                  SizedBox(height: 100),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryLoginColor,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        minimumSize: Size(343, 49),
                      ),
                      onPressed: () async {
                        await context.read<LoginCubit>().checkValidation();
                        await context.read<LoginCubit>().emitLoginState(
                          email: email.text,
                          password: password.text,
                        );
                        
                      },
                      child: Text("login.Login").tr(),
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
