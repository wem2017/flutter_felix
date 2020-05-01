import 'package:felix_flutter/models/model.dart';

class EventModel {
  final int id;
  final String title;
  final String image;
  final String address;
  final DateTime startTime;
  final CategoryType category;

  EventModel(
    this.id,
    this.title,
    this.image,
    this.address,
    this.startTime,
    this.category,
  );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      json['id'] as int ?? 0,
      json['title'] as String ?? '',
      json['image'] as String ?? '',
      json['address'] as String ?? '',
      DateTime.tryParse(json['start_time']) ?? DateTime.now(), // UTC
      CategoryType.event,
    );
  }
}
