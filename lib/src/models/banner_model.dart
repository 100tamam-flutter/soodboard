class BannerModel {
  final String image;
  final String id;
  final DateTime endTime;

  const BannerModel(
      {required this.image, required this.id, required this.endTime});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'] as String,
      id: json["id"],
      endTime: DateTime.parse(json["end_time"]),
    );
  }
}
