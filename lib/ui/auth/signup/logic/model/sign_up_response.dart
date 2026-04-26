import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponse {
  final String? message;
  final bool? status;
  final dynamic userData;
  final dynamic verifyCode;

  SignUpResponse({
    this.message, 
    this.status,
    this.userData,
    this.verifyCode,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}