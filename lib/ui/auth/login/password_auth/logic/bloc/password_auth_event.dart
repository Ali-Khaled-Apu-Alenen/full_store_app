part of 'password_auth_bloc.dart';

@immutable
sealed class PasswordAuthEvent {}

final class EmailCheck extends PasswordAuthEvent {

}


final class PasswordConfermation extends PasswordAuthEvent {
  
}

