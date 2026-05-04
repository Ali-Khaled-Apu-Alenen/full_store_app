part of 'login_cubit.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(T data) = _Success;
  const factory LoginState.failure(String message) = _Failure;
  const factory LoginState.togglePassword(bool passwordVisible) = _TogglePassword;
  const factory LoginState.toggleRememberMe(bool rememberMe) = _ToggleRememberMe;
}
