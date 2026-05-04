import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/ui/auth/signup/logic/cubit/sign_up_state.dart';
import 'package:ali_store/ui/auth/signup/logic/model/repo/sign_up_repo.dart';
import 'package:ali_store/ui/auth/signup/logic/model/sign_up_request_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(SignUpState.initial()) {
    formKey = GlobalKey<FormState>();
  }
  late GlobalKey<FormState> formKey;
  checkValidation() {
    if (formKey.currentState!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  emitSignUpStates({
    required String email,
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    emit(SignUpState.loading());

    print('2. Calling signup repository...');
    final response = await _signupRepo.signup(
      SignUpRequestData(
        email: email,
        password: password,
        phone: phone,
        // verifyCode: "123456",
      ),
    );

    print('3. Processing repository response...');
    response.when(
      success: (data) {
        print('4. SUCCESS - Emitting success state');
        print('   Response: ${data.message}');
        print('   Status: ${data.status}');
        print('   User Data: ${data.userData}');
        print('   Timestamp: ${DateTime.now()}');
        print('=== SIGNUP PROCESS COMPLETED SUCCESSFULLY ===\n');
        print(data.verifyCode);
        emit(SignUpState.success(data));
        Navigator.pushNamed(
          context,
          RoutesName.checkCode,
          arguments: [email, data.userData.verify_code],
        );
      },
      failure: (error) {
        print('4. FAILURE - Emitting error state');
        print('   Error: ${error.message}');
        print('   Timestamp: ${DateTime.now()}');
        print('=== SIGNUP PROCESS FAILED ===\n');
        emit(SignUpState.failure(error: error.message));
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
