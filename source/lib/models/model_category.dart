import 'package:felix_flutter/utils/utils.dart';
import 'package:flutter/cupertino.dart';

enum CategoryType {
  hotel,
  tour,
  car,
  flight,
  cruise,
  bus,
  event,
  news,
}

class CategoryModel {
  final int id;
  final String title;
  final IconData icon;
  final Color color;
  final CategoryType type;

  CategoryModel({
    this.id,
    this.title,
    this.icon,
    this.color,
    this.type,
  });

  static CategoryType _setType(String type) {
    switch (type) {
      case 'hotel':
        return CategoryType.hotel;
      case 'tour':
        return CategoryType.tour;
      case 'car':
        return CategoryType.car;
      case 'flight':
        return CategoryType.flight;
      case 'cruise':
        return CategoryType.cruise;
      case 'bus':
        return CategoryType.bus;
      case 'event':
        return CategoryType.event;
      case 'news':
        return CategoryType.news;
      default:
        return null;
    }
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final icon = UtilIcon.getIconData(json['icon'] ?? "Unknown");
    final color = UtilColor.getColorFromHex(json['color'] ?? "#ff8a65");
    return CategoryModel(
      id: json['id'] as int ?? 0,
      title: json['title'] as String ?? 'Unknown',
      icon: icon,
      color: color,
      type: _setType(json['type'] as String ?? "Unknown"),
    );
  }
}
