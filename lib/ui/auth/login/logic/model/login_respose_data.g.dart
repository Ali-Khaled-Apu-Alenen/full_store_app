// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_respose_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) =>
    LoginResponseData(
      status: json['status'] as String?,
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseDataToJson(LoginResponseData instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.userData};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  usersEmail: json['users_email'] as String?,
  usersPhone: json['users_phone'] as String?,
  usersPassword: json['users_password'] as String?,
  usersVerifyCode: (json['users_verify_code'] as num?)?.toInt(),
  usersApprove: (json['users_approve'] as num?)?.toInt(),
  usersId: (json['users_id'] as num?)?.toInt(),
  usersCreate: json['users_create'] as String?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'users_email': instance.usersEmail,
  'users_phone': instance.usersPhone,
  'users_password': instance.usersPassword,
  'users_verify_code': instance.usersVerifyCode,
  'users_approve': instance.usersApprove,
  'users_id': instance.usersId,
  'users_create': instance.usersCreate,
};
