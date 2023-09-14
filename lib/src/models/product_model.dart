
class ProductModel {
  final String id;
  final String title;
  final String image;
  final double price;
  final int discount;
  final double previousPrice;
  final double rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discount,
    required this.previousPrice,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      price: json['price'] as double,
      discount: json['discount'] as int,
      previousPrice: json['previousPrice'] as double,
      rating: json['rating'] as double,
    );
  }
}
