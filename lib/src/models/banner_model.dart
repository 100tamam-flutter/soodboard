class BannerModel {
  final String image;
  final String id;
  const BannerModel.BannerModel({
    required this.image,
    required this.id
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel.BannerModel(
      image: json['image'] as String, id: json["id"]
    );
  }
}
