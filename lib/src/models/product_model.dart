class ProductModel {
  final String id;
  final String title;
  final String image;
  final double price;
  final int discount;
  final double rating;
  final String category;
  final double previousPrice;

  const ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discount,
    required this.rating,
    required this.category,
    required this.previousPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      image: (json['images'] as List<dynamic>).map((e) => e as String).toList()[0],
      price: json['price'] as double,
      discount: json['discount'] as int,
      rating: json['rating'] as double,
      category: json['category'] as String,
      previousPrice: json['previousPrice'] as double,
    );
  }
}
