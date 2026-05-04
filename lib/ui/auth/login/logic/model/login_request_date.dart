import 'package:json_annotation/json_annotation.dart';
part 'login_request_date.g.dart';
@JsonSerializable()
class LoginRequestData {
  final String email;
  final String password;

  LoginRequestData({
    required this.email,
    required this.password,
  });



  Map<String, dynamic> toJson() => _$LoginRequestDataToJson(this);
}
