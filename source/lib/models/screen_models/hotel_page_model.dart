import 'package:felix_flutter/models/model.dart';

class HotelPageModel {
  final List<HotelModel> hotel;

  HotelPageModel(
    this.hotel,
  );

  factory HotelPageModel.fromJson(Map<String, dynamic> json) {
    final Iterable refactorList = json['hotel'] ?? [];

    final list = refactorList.map((item) {
      return HotelModel.fromJson(item);
    }).toList();

    return HotelPageModel(list);
  }
}
