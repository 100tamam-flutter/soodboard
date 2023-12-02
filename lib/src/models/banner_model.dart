import 'dart:math';

class BannerModel {
  final String title;
  final String image;
  final String id;
  final DateTime endTime;

  const BannerModel({
    required this.title,
    required this.image,
    required this.id,
    required this.endTime,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    //TODO: add custom end time on mock
    final random = Random();
    final int increasingHours = random.nextInt(5) + 1;

    return BannerModel(
      title: json['title'] as String,
      image: json['image'] as String,
      id: json["id"] as String,
      //TODO: add custom end time on mock
      endTime: DateTime.now().add(Duration(hours: increasingHours)),
    );
  }
}
