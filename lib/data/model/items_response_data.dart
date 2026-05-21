import 'package:json_annotation/json_annotation.dart';
part 'items_response_data.g.dart';

@JsonSerializable()
class ItemsResponseData {
  final String status;
  final List<Item> data;

  ItemsResponseData({required this.status, required this.data});

  factory ItemsResponseData.fromJson(Map<String, dynamic> json) {
    return _$ItemsResponseDataFromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'status': status,
  //     'data': data.map((e) => e.toJson()).toList(),
  //   };
  // }
}

@JsonSerializable()
class Item {
  final int item_id;
  final String item_name;
  final String item_name_ar;
  final String item_description;
  final String item_description_ar;
  final int item_count;
  final String item_image;
  final int item_active;
  final double item_price;
  final int item_discount;
  final String item_date;
  final int items_categorie;
  final int favorite;

  Item({
    required this.item_id,
    required this.item_name,
    required this.item_name_ar,
    required this.item_description,
    required this.item_description_ar,
    required this.item_count,
    required this.item_image,
    required this.item_active,
    required this.item_price,
    required this.item_discount,
    required this.item_date,
    required this.items_categorie,
    required this.favorite,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return _$ItemFromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'item_id': item_id,
  //     'item_name': item_name,
  //     'item_name_ar': item_name_ar,
  //     'item_description': item_description,
  //     'item_description_ar': item_description_ar,
  //     'item_count': item_count,
  //     'item_image': item_image,
  //     'item_active': item_active,
  //     'item_price': item_price,
  //     'item_discount': item_discount,
  //     'item_date': item_date,
  //     'items_categorie': items_categorie,
  //   };
  // }
}
