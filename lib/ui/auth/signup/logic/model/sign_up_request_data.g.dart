// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestData _$SignUpRequestDataFromJson(Map<String, dynamic> json) =>
    SignUpRequestData(
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$SignUpRequestDataToJson(SignUpRequestData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
    };
