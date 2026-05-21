// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_favorite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetFavoriteRequest _$SetFavoriteRequestFromJson(Map<String, dynamic> json) =>
    SetFavoriteRequest(
      itemId: (json['itemId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$SetFavoriteRequestToJson(SetFavoriteRequest instance) =>
    <String, dynamic>{'itemId': instance.itemId, 'userId': instance.userId};
