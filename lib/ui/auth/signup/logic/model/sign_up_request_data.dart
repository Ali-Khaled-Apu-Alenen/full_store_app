import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_data.g.dart';
@JsonSerializable()
class SignUpRequestData {
  // final String name;
  final String email;
  final String password;
  final String phone;
  // final String verifyCode;

  SignUpRequestData({
    // required this.name,
    required this.email,
    required this.password,
    required this.phone,
    // required this.verifyCode,
  });

  // factory SignUpRequestData.fromJson(Map<String, dynamic> json) =>
  //     _$SignUpRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestDataToJson(this);
}