part of 'password_auth_bloc.dart';

@immutable
sealed class PasswordAuthState {}

final class PasswordAuthInitial extends PasswordAuthState {}
final class EmailCheckSuccess extends PasswordAuthState {}
final class EmailCheckFailure extends PasswordAuthState {}
final class CodeCheckSuccess extends PasswordAuthState {}
final class CodeCheckFailure extends PasswordAuthState {}
final class PasswordConfermationSuccess extends PasswordAuthState {}
final class PasswordConfermationFailure extends PasswordAuthState {}

