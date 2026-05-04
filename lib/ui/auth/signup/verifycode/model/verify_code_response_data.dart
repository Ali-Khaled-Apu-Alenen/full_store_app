import 'package:json_annotation/json_annotation.dart';
part 'verify_code_response_data.g.dart';

@JsonSerializable()
class VerifyCodeResponseData {
  final String message;
  final bool status;

  VerifyCodeResponseData({
    required this.message,
    required this.status,
  });

  factory VerifyCodeResponseData.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseDataFromJson(json);

}
