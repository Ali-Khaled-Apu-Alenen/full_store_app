// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeResponseData _$VerifyCodeResponseDataFromJson(
  Map<String, dynamic> json,
) => VerifyCodeResponseData(
  message: json['message'] as String,
  status: json['status'] as bool,
);

Map<String, dynamic> _$VerifyCodeResponseDataToJson(
  VerifyCodeResponseData instance,
) => <String, dynamic>{'message': instance.message, 'status': instance.status};
