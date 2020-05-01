import 'package:felix_flutter/models/model.dart';

class BookingHistoryPageModel {
  final List<BookingHistoryModel> bookingHistory;

  BookingHistoryPageModel(
    this.bookingHistory,
  );

  factory BookingHistoryPageModel.fromJson(Map<String, dynamic> json) {
    final Iterable convertMessage = json['booking_history'] ?? [];

    final listBookingHistory = convertMessage.map((item) {
      return BookingHistoryModel.fromJson(item);
    }).toList();

    return BookingHistoryPageModel(
      listBookingHistory,
    );
  }
}
