// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeRequestData _$VerifyCodeRequestDataFromJson(
  Map<String, dynamic> json,
) => VerifyCodeRequestData(
  email: json['email'] as String,
  verifyCode: json['verifyCode'] as String,
);

Map<String, dynamic> _$VerifyCodeRequestDataToJson(
  VerifyCodeRequestData instance,
) => <String, dynamic>{
  'email': instance.email,
  'verifyCode': instance.verifyCode,
};
