import 'package:json_annotation/json_annotation.dart';
part 'set_favorite_request.g.dart';
@JsonSerializable()
class SetFavoriteRequest {
  final int itemId;
  final int userId;

  SetFavoriteRequest({required this.itemId, required this.userId});


  Map<String, dynamic> toJson() {
    return _$SetFavoriteRequestToJson(this);
  }
}