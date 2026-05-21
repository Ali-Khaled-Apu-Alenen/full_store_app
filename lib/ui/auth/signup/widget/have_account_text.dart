import 'package:ali_store/core/constatnt/colors.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("login.Already have an account?").tr(),
        InkWell(
          child: Text(
            "login.Sign in",
            style: TextStyle(color: AppColors.primaryLoginColor, fontSize: 14),
          ).tr(),
          onTap: () {
            Navigator.pushNamed(context, RoutesName.login);
          },
        ),
      ],
    );
  }
}
