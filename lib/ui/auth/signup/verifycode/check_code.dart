import 'dart:math';
import 'package:advanced_store_project/core/constatnt/colors.dart';
import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/di/dependency_injec.dart';
import 'package:advanced_store_project/core/styles/text_styles.dart';
import 'package:advanced_store_project/ui/auth/login/widget/long_background.dart';
import 'package:advanced_store_project/ui/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_store_project/ui/auth/signup/verifycode/cubit/verify_code_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class CheckCode extends StatelessWidget {
  final String email;
  const CheckCode({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
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
              child: BlocProvider(
                create: (context) => getIt<VerifyCodeCubit>(),
                child: BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: BlocListener<VerifyCodeCubit, VerifyCodeState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        failure: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Verify code is incorrect").tr()),
                          );
                        },
                        success: () {
                          Navigator.of(context).pushNamed(RoutesName.login);
                        },
                      );
                    },
                    child: Builder(
                      builder: (context) {
                        return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 525),
                        Container(
                          margin: EdgeInsets.only(left: 24),
                          child: Text(
                            "checkCode.Check Your Email",
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
                            "checkCode.Code Sent",
                            textAlign: TextAlign.center,
                          ).tr(),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
                            builder: (context, state) {
                              return Pinput(
                                length: 5,
                                // controller: context.read<PasswordAuthBloc>().codeCheckController,
                                focusedPinTheme: PinTheme(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryLoginColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                                onCompleted: (pin) {
                                  context.read<VerifyCodeCubit>().emitVerifyCodeStates(verifyCode: pin, email: email, context: context);
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 22),

                        SizedBox(height: 50),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("wrong code").tr()),
                            );
                          },
                          child: context.locale.languageCode == "ar"
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      "asset/svgs/Group_arrow.svg",
                                    ),
                                    SizedBox(width: 8),
                                    Text("Continue").tr(),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Continue").tr(),
                                    SizedBox(width: 8),
                                    SvgPicture.asset(
                                      "asset/svgs/Group_arrow.svg",
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    );
                  },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
