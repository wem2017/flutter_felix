import 'package:felix_flutter/models/model.dart';

class HotelModel {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final CategoryType category;

  HotelModel(
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.category,
  );

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      json['id'] as int ?? 0,
      json['title'] as String ?? '',
      json['subtitle'] as String ?? '',
      json['image'] as String ?? '',
      CategoryType.hotel,
    );
  }
}
