class ProductDetailModel {
  final String id;
  final String title;
  final String firstImage;
  final String thirdImage;
  final String secondImage;
  final double price;
  final double before;
  final double offer;
  final String description;
  final double rating;
  final List<String> sizes;
  final List<String> colors;

  const ProductDetailModel({
    required this.title,
    required this.price,
    required this.firstImage,
    required this.id,
    required this.secondImage,
    required this.thirdImage,
    required this.before,
    required this.offer,
    required this.description,
    required this.rating,
    required this.sizes,
    required this.colors,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id'] as String,
      title: json['title'] as String,
      firstImage: json['image1'] as String,
      secondImage: json['image2'] as String,
      thirdImage: json['image3'] as String,
      price: json['price'] as double,
      before: json['before'] as double,
      offer: json['offer'] as double,
      description: json['description'] as String,
      rating: json['rating'] as double,
      sizes: (json['sizes'] as List).map((e) => e as String).toList(),
      colors: (json['colors'] as List).map((e) => e as String).toList(),
    );
  }
}
