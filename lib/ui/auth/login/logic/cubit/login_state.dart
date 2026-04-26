part of 'login_cubit.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(T data) = _Success;
  const factory LoginState.failure(String message) = _Failure;
  const factory LoginState.togglePassword() = _TogglePassword;
  const factory LoginState.toggleRememberMe() = _ToggleRememberMe;
}
