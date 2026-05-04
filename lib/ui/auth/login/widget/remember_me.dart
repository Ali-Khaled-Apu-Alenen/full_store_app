import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/functions/custom_check_box.dart';
import 'package:ali_store/ui/auth/login/logic/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMe extends StatelessWidget {
  final bool isChecked;
  const RememberMe({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Checkbox(
          //   fillColor: WidgetStatePropertyAll(AppColors.primaryLoginColor),
          //   value: true, onChanged: (value) {}),
          CustomCheckBox(
            onTap: () => context.read<LoginCubit>().toggleRememberMe(),
            isChecked: isChecked,
          ),
          Text("login.Remember me").tr(),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.forgotPassword);
            },
            child: Text("login.Forgot password?").tr(),
          ),
        ],
      ),
    );
  }
}
