// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsResponseData _$ItemsResponseDataFromJson(Map<String, dynamic> json) =>
    ItemsResponseData(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsResponseDataToJson(ItemsResponseData instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  item_id: (json['item_id'] as num).toInt(),
  item_name: json['item_name'] as String,
  item_name_ar: json['item_name_ar'] as String,
  item_description: json['item_description'] as String,
  item_description_ar: json['item_description_ar'] as String,
  item_count: (json['item_count'] as num).toInt(),
  item_image: json['item_image'] as String,
  item_active: (json['item_active'] as num).toInt(),
  item_price: (json['item_price'] as num).toDouble(),
  item_discount: (json['item_discount'] as num).toInt(),
  item_date: json['item_date'] as String,
  items_categorie: (json['items_categorie'] as num).toInt(),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'item_id': instance.item_id,
  'item_name': instance.item_name,
  'item_name_ar': instance.item_name_ar,
  'item_description': instance.item_description,
  'item_description_ar': instance.item_description_ar,
  'item_count': instance.item_count,
  'item_image': instance.item_image,
  'item_active': instance.item_active,
  'item_price': instance.item_price,
  'item_discount': instance.item_discount,
  'item_date': instance.item_date,
  'items_categorie': instance.items_categorie,
};
