import 'package:felix_flutter/models/model.dart';

class TourModel {
  final int id;
  final String title;
  final String image;
  final CategoryType category;

  TourModel(
    this.id,
    this.title,
    this.image,
    this.category,
  );

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      json['id'] as int ?? 0,
      json['title'] as String ?? '',
      json['image'] as String ?? '',
      CategoryType.tour,
    );
  }
}
