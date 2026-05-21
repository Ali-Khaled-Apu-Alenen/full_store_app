import 'package:json_annotation/json_annotation.dart';

part 'set_favorite_response.g.dart';

@JsonSerializable()
class SetFavoriteResponse {
  final String status;
  final String message;

  SetFavoriteResponse({required this.status, required this.message});

  factory SetFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return _$SetFavoriteResponseFromJson(json);
  }
}