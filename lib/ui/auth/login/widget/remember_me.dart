import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/functions/custom_check_box.dart';
import 'package:advanced_store_project/ui/auth/login/logic/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Checkbox(
          //   fillColor: WidgetStatePropertyAll(AppColors.primaryLoginColor),
          //   value: true, onChanged: (value) {}),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomCheckBox(
                onTap: () => context.read<LoginCubit>().toggleRememberMe(),
                isChecked: context.read<LoginCubit>().rememberMe,
              );
            },
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
