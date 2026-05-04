import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/bloc/password_auth_bloc.dart';
import 'forget_password.dart';
import '../../signup/verifycode/check_code.dart';
import 'reset_password.dart';

class PasswordAuthWrapper extends StatelessWidget {
  final String initialRoute;

  const PasswordAuthWrapper({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordAuthBloc(),
      child: Navigator(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RoutesName.forgotPassword:
              return MaterialPageRoute(
                builder: (context) => ForgetPassword(),
              );
            // case RoutesName.checkCode:
            //   return MaterialPageRoute(
            //     builder: (context) => CheckCode(),
            //   );
            case RoutesName.resetPassword:
              return MaterialPageRoute(
                builder: (context) => ResetPassword(),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => ForgetPassword(),
              );
          }
        },
        initialRoute: initialRoute,
      ),
    );
  }
}
