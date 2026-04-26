import 'package:json_annotation/json_annotation.dart';

part 'login_respose_data.g.dart';

@JsonSerializable()
class LoginResponseData {
  final String? status;
  @JsonKey(name: 'data')
  final UserData? userData;
  
  LoginResponseData({
    this.status,
    this.userData,
  });
  
  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'users_email')
  final String? usersEmail;
  @JsonKey(name: 'users_phone')
  final String? usersPhone;
  @JsonKey(name: 'users_password')
  final String? usersPassword;
  @JsonKey(name: 'users_verify_code')
  final int? usersVerifyCode;
  @JsonKey(name: 'users_approve')
  final int? usersApprove;
  @JsonKey(name: 'users_id')
  final int? usersId;
  @JsonKey(name: 'users_create')
  final String? usersCreate;
  
  UserData({
    this.usersEmail,
    this.usersPhone,
    this.usersPassword,
    this.usersVerifyCode,
    this.usersApprove,
    this.usersId,
    this.usersCreate,
  });
  
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}