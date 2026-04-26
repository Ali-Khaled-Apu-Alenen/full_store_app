import 'package:advanced_store_project/core/constatnt/shared_pref_keys.dart';
import 'package:advanced_store_project/core/networking/api_result.dart';
import 'package:advanced_store_project/core/services/shared_preferences_helper.dart';
import 'package:advanced_store_project/ui/auth/login/logic/model/login_request_date.dart';
import 'package:advanced_store_project/ui/auth/login/logic/model/repo/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState<dynamic>> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial()) {
    formKey = GlobalKey();
  }
  late GlobalKey<FormState> formKey;

  bool obscurePassword = false;
  bool rememberMe = false;
  checkValidation() {
    if (formKey.currentState!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  emitLoginState({required String email, required String password}) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestData(email: email, password: password),
    );
    response.when(
      success: (data) {
        saveLoginData();
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.failure(error.message));
        print(error.message);
      },
    );
  }

  toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    emit(
      const LoginState.togglePassword(),
    ); // Emit new state to trigger UI rebuild
    // print(obscurePassword);
    // return obscurePassword;
  }

  toggleRememberMe() {
    rememberMe = !rememberMe;
    // print("sharedpref saved");
    emit(const LoginState.toggleRememberMe());
  }

  Future<void> saveLoginData() async {
    await SharedPreferencesHelper.setData(
      SharedPrefKeys.rememberMeKey,
      rememberMe,
    );
    await SharedPreferencesHelper.setData(SharedPrefKeys.isLoggedInKey, true);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
