import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/constatnt/shared_pref_keys.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/services/shared_preferences_helper.dart';
import 'package:ali_store/ui/auth/login/logic/model/login_request_date.dart';
import 'package:ali_store/ui/auth/login/logic/model/repo/login_repo.dart';
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
  int? userData;
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
      success: (data) async {
        userData = data.userData?.usersId;
        await saveLoginData();
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
      LoginState.togglePassword(obscurePassword),
    ); // Emit new state to trigger UI rebuild
    // print(obscurePassword);
    // return obscurePassword;
  }

  toggleRememberMe() {
    rememberMe = !rememberMe;
    // print("sharedpref saved");
    emit(LoginState.toggleRememberMe(rememberMe));
  }

  Future<void> saveLoginData() async {
    await SharedPreferencesHelper.setData(
      SharedPrefKeys.rememberMeKey,
      rememberMe,
    );
    await SharedPreferencesHelper.setData(SharedPrefKeys.isLoggedInKey, true);
    await SharedPreferencesHelper.setData(SharedPrefKeys.userDataKey, userData);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
