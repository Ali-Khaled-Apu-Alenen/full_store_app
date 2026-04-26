import 'package:json_annotation/json_annotation.dart';
part 'categorie_response_data.g.dart';

@JsonSerializable()
class CategorieResponseData {
  final String status;
  final List<Categorie> data;

  CategorieResponseData({required this.status, required this.data});

  factory CategorieResponseData.fromJson(Map<String, dynamic> json) {
    
    return _$CategorieResponseDataFromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   return {'status': status, 'data': data.map((e) => e.toJson()).toList()};
  // }
}

@JsonSerializable()
class Categorie {
  final int id;
  final String name;
  final String image;
  final String? dateTime;

  Categorie({
    required this.id,
    required this.name,
    required this.image,
    this.dateTime,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'],
      name: json['c_name'],
      image: json['c_image'],
      dateTime: json['c_date_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'c_name': name,
      'c_image': image,
      'c_date_time': dateTime,
    };
  }
}
