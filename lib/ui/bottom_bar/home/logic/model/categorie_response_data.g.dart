// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorieResponseData _$CategorieResponseDataFromJson(
  Map<String, dynamic> json,
) => CategorieResponseData(
  status: json['status'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => Categorie.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategorieResponseDataToJson(
  CategorieResponseData instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

Categorie _$CategorieFromJson(Map<String, dynamic> json) => Categorie(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  dateTime: json['dateTime'] as String?,
);

Map<String, dynamic> _$CategorieToJson(Categorie instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'dateTime': instance.dateTime,
};
