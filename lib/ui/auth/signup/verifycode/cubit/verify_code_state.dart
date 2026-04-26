part of 'verify_code_cubit.dart';

@freezed
class VerifyCodeState with _$VerifyCodeState {
  const factory VerifyCodeState.initial() = _Initial;
  const factory VerifyCodeState.loading() = _Loading;
  const factory VerifyCodeState.success() = _Success;
  const factory VerifyCodeState.failure({required String message}) = _Failure;
}
