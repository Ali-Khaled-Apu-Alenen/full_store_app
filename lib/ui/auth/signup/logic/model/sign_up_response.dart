import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponse {
  final String? message;
  final bool? status;
  final UserData userData;
  final String? verifyCode;


  SignUpResponse({
    this.message, 
    this.status,
    required this.userData,
    this.verifyCode,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      userData: UserData.fromJson(json['userData'] as Map<String, dynamic>),
      verifyCode: json['verifyCode']?.toString(),
    );
  }
}

class UserData {
  final String email;
  final String phone;
  final String verify_code;
  final String created_at;

  UserData({
    required this.email,
    required this.phone,
    required this.verify_code,
    required this.created_at,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    email: json['email'].toString(),
    phone: json['phone'].toString(),
    verify_code: json['verify_code'].toString(),
    created_at: json['created_at'].toString(),
  );
}
