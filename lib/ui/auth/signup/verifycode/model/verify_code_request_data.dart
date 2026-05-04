import 'package:json_annotation/json_annotation.dart';
part 'verify_code_request_data.g.dart';
@JsonSerializable()
class VerifyCodeRequestData {
  final String email;
  final String verifyCode;

  VerifyCodeRequestData({
    required this.email,
    required this.verifyCode,
  });


  Map<String, dynamic> toJson() => _$VerifyCodeRequestDataToJson(this);
}
