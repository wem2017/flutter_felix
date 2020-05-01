class BookingHistoryModel {
  final int id;
  final String title;
  final DateTime checkIn;
  final DateTime checkOut;
  final int day;
  final int night;
  final String price;

  BookingHistoryModel(
    this.id,
    this.title,
    this.checkIn,
    this.checkOut,
    this.day,
    this.night,
    this.price,
  );

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    return BookingHistoryModel(
      json['id'] as int ?? 0,
      json['title'] as String ?? '',
      DateTime.tryParse(json['check_in']) ?? DateTime.now(),
      DateTime.tryParse(json['check_out']) ?? DateTime.now(),
      json['day'] as int ?? 0,
      json['night'] as int ?? 0,
      json['price'] as String ?? '',
    );
  }
}
