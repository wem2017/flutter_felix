import 'package:felix_flutter/models/model.dart';

class HomePageModel {
  final List<ImageModel> banner;
  final List<CategoryModel> category;
  final List<HotelModel> promotion;
  final List<TourModel> tour;
  final List<EventModel> event;
  final List<HotelModel> list;

  HomePageModel(
    this.banner,
    this.category,
    this.promotion,
    this.tour,
    this.event,
    this.list,
  );

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    final Iterable refactorBanner = json['banner'] ?? [];
    final Iterable refactorCategory = json['category'] ?? [];
    final Iterable refactorPromotion = json['promotion'] ?? [];
    final Iterable refactorTour = json['tour'] ?? [];
    final Iterable refactorEvent = json['event'] ?? [];
    final Iterable refactorList = json['list'] ?? [];

    final listBanner = refactorBanner.map((item) {
      return ImageModel.fromJson(item);
    }).toList();

    final listCategory = refactorCategory.map((item) {
      return CategoryModel.fromJson(item);
    }).toList();

    final listPromotion = refactorPromotion.map((item) {
      return HotelModel.fromJson(item);
    }).toList();

    final listTour = refactorTour.map((item) {
      return TourModel.fromJson(item);
    }).toList();

    final listEvent = refactorEvent.map((item) {
      return EventModel.fromJson(item);
    }).toList();

    final list = refactorList.map((item) {
      return HotelModel.fromJson(item);
    }).toList();

    return HomePageModel(
      listBanner,
      listCategory,
      listPromotion,
      listTour,
      listEvent,
      list,
    );
  }
}
