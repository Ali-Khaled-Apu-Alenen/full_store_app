import 'dart:math';

import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/functions/validate_input.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:advanced_store_project/ui/auth/login/password_auth/logic/bloc/password_auth_bloc.dart';
import 'package:advanced_store_project/ui/auth/login/widget/background.dart';
import 'package:advanced_store_project/ui/auth/login/widget/textforms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: context.locale.languageCode == 'ar'
                  ? Matrix4.rotationY(pi)
                  : Matrix4.identity(),
              child: BackgroundLogin(),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                color: Colors.transparent,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Form(
                key: passwordKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 370),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text(
                        "forgetPassword.Forget Password",
                        style: TextStyles.font24MediumExtraDark,
                      ).tr(),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 24),
                      width: 100,
                      height: 4,
                      color: AppColors.primaryLoginColor,
                    ),
                    SizedBox(height: 22),
                    Center(
                      child: Text(
                        "resetPassword.Reset Password",
                        textAlign: TextAlign.center,
                      ).tr(),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      height: 62,
                      child: Textforms(
                        controller: context
                            .read<PasswordAuthBloc>()
                            .passwordCheckController,
                        validator: (value) {
                          return validateInput(value, 5, 25, "password");
                        },
                        isPassword: true,
                        isOpscured: false,
                        lableText: tr("resetPassword.Enter Your Password"),
                        imageIcon: "asset/svgs/mail_icon.svg",
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      height: 62,
                      child: Textforms(
                        controller: context
                            .read<PasswordAuthBloc>()
                            .confirmPasswordCheckController,
                        validator: (value) {
                          return validateInput(value, 5, 25, "password");
                        },
                        isPassword: true,
                        isOpscured: false,
                        lableText: tr("resetPassword.confirmPassword"),
                        imageIcon: "asset/svgs/mail_icon.svg",
                      ),
                    ),

                    SizedBox(height: 50),
                    BlocListener<PasswordAuthBloc, PasswordAuthState>(
                      listener: (context, state) {
                        if (state is PasswordConfermationSuccess) {
                          print("success password");
                          Navigator.of(context, rootNavigator: true).pushReplacementNamed(RoutesName.login);
                        } else if (state is PasswordConfermationFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Password confirmation failed"),
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<PasswordAuthBloc, PasswordAuthState>(
                        builder: (context, state) {
                          return Center(
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
                              onPressed: () {
                                if (passwordKey.currentState!.validate()) {
                                  context.read<PasswordAuthBloc>().add(
                                    PasswordConfermation(),
                                  );
                                }
                              },
                              child: Text("resetPassword.Reset Password").tr(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
