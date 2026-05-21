import 'package:json_annotation/json_annotation.dart';
part 'items_request_data.g.dart';
@JsonSerializable()
class ItemsRequestData {

  final int userId;

  ItemsRequestData({required this.userId});


  Map<String, dynamic> toJson() {
    return _$ItemsRequestDataToJson(this);
  }
}