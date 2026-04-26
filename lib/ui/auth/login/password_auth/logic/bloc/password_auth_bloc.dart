import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'password_auth_event.dart';
part 'password_auth_state.dart';

class PasswordAuthBloc extends Bloc<PasswordAuthEvent, PasswordAuthState> {
  TextEditingController? _emailCheckController;
  TextEditingController? _codeCheckController;
  TextEditingController? _passwordCheckController;
  TextEditingController? _confirmPasswordCheckController;
  
  TextEditingController get emailCheckController {
    _emailCheckController ??= TextEditingController();
    return _emailCheckController!;
  }
  
  TextEditingController get codeCheckController {
    _codeCheckController ??= TextEditingController();
    return _codeCheckController!;
  }
  
  TextEditingController get passwordCheckController {
    _passwordCheckController ??= TextEditingController();
    return _passwordCheckController!;
  }
  
  TextEditingController get confirmPasswordCheckController {
    _confirmPasswordCheckController ??= TextEditingController();
    return _confirmPasswordCheckController!;
  }
  
  PasswordAuthBloc() : super(PasswordAuthInitial()) {
    on<PasswordAuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<EmailCheck>((event, emit) {
      final email = emailCheckController.text;
    
      // Basic email validation without GlobalKey
      if (email.isNotEmpty && email.contains('@')) {
      
          emit(EmailCheckSuccess());
          print("email is correct");
      
      
    
      } else {
        emit(EmailCheckFailure());
        print("email is not valid");
      }
    });
  
    on<PasswordConfermation>((event, emit) {
      if(passwordCheckController.text == confirmPasswordCheckController.text) {
        emit(PasswordConfermationSuccess());
      } else {
        emit(PasswordConfermationFailure());
      }
    });
  }

  @override
  Future<void> close() {
    _emailCheckController?.dispose();
    _codeCheckController?.dispose();
    _passwordCheckController?.dispose();
    _confirmPasswordCheckController?.dispose();
    return super.close();
  }
}
