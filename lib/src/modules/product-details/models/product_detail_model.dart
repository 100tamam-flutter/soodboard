
class ProductDetailModel {
  final String title;
  final String image1;
  final String image2;
  final String image3;

  const ProductDetailModel({required this.title, required this.image1, required this.image3, required this.image2,});

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      title: json['title'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
    );
  }

}