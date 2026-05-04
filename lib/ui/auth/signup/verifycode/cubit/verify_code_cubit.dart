import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/networking/api_services.dart';
import 'package:ali_store/ui/auth/signup/verifycode/model/repo/verify_code_repo.dart';
import 'package:ali_store/ui/auth/signup/verifycode/model/verify_code_request_data.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_state.dart';
part 'verify_code_cubit.freezed.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {

  VerifyCodeCubit(  VerifyCodeRepo verifyCodeRepo)
    : _verifyCodeRepo = verifyCodeRepo,
      super(VerifyCodeState.initial());
    
  final VerifyCodeRepo _verifyCodeRepo;
  Future<void> emitVerifyCodeStates(
{required String email,required String verifyCode,required BuildContext context}

  ) 
  
  async {
    emit(VerifyCodeState.loading());
    try {
      final response = await _verifyCodeRepo.verifyCode(
        VerifyCodeRequestData(email: email, verifyCode: verifyCode),
      );
      response.when(
        success: (data) {
          emit(VerifyCodeState.success());
          Navigator.of(context).pushNamed(RoutesName.login);
        },
        failure: (error) {
          emit(VerifyCodeState.failure(message: error.message));
        },
      );
    } catch (e) {
      emit(VerifyCodeState.failure(message: e.toString()));
    }
  }
}
