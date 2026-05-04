import 'dart:math';

import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/functions/validate_input.dart';
import 'package:ali_store/core/styles/text_styles.dart';
import 'package:ali_store/ui/auth/login/password_auth/logic/bloc/password_auth_bloc.dart';
import 'package:ali_store/ui/auth/login/widget/long_background.dart';
import 'package:ali_store/ui/auth/login/widget/textforms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: context.locale.languageCode == 'ar'
                  ? Matrix4.rotationY(pi)
                  : Matrix4.identity(),
              child: LongBackground(),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 525),
                  Container(
                    margin: EdgeInsets.only(left: 24),
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
                      "forgetPassword.Reset Password",
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    height: 62,
                    child: Form(
                      key: emailKey,
                      child: Textforms(
                        controller: context.read<PasswordAuthBloc>().emailCheckController,
                        
                        validator: (value) {
                          return validateInput(value, 5, 25, "email");
                        },
                        isPassword: false,
                        isOpscured: false,
                        lableText: tr("forgetPassword.Enter Your Email"),
                        imageIcon: "asset/svgs/mail_icon.svg",
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
              
                  SizedBox(height: 50),
                  
                  BlocListener<PasswordAuthBloc, PasswordAuthState>(
                      listener: (context, state) {
                        if(state is EmailCheckSuccess) {
                          Navigator.pushNamed(context, RoutesName.checkCode);
                        } else if(state is EmailCheckFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Email not found").tr()),
                          );
                        }
                      },
                      child: BlocBuilder<PasswordAuthBloc, PasswordAuthState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: ()async {
                              if (emailKey.currentState?.validate() == true) {
                                context.read<PasswordAuthBloc>().add(EmailCheck());
                              }
                            },
                        child: context.locale.languageCode == "ar"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("asset/svgs/Group_arrow.svg"),
                                  SizedBox(width: 8),
                                  Text("Continue").tr(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Continue").tr(),
                                  SizedBox(width: 8),
                                  SvgPicture.asset("asset/svgs/Group_arrow.svg"),
                                ],
                              ),
                          );
                        },
                      ),
                    ),
              
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
