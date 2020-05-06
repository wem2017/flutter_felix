import 'package:felix_flutter/models/model.dart';

class HotelModel {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final double rate;
  final int numRate;
  final String rateText;
  final String address;
  final String phone;
  final String price;
  final String kind;
  final String highlight;
  final String status;
  final bool favorite;
  final CategoryType category;

  HotelModel(
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.rate,
    this.numRate,
    this.rateText,
    this.address,
    this.phone,
    this.price,
    this.kind,
    this.highlight,
    this.status,
    this.favorite,
    this.category,
  );

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      json['id'] as int ?? 0,
      json['title'] as String ?? '',
      json['subtitle'] as String ?? '',
      json['image'] as String ?? '',
      json['rate'] as double ?? 0.0,
      json['num_review'] as int ?? 0,
      json['rate_text'] as String ?? '',
      json['address'] as String ?? '',
      json['phone'] as String ?? '',
      json['price'] as String ?? '',
      json['kind'] as String ?? '',
      json['highlight'] as String ?? '',
      json['status'] as String ?? '',
      json['favorite'] as bool ?? false,
      CategoryType.hotel,
    );
  }
}
