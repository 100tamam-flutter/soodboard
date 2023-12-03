class ProductModel {
  final String id;
  final String title;
  final List<String> images;
  final List<String> sizes;
  final List<String> colors;
  final double price;
  final int discount;
  final double previousPrice;
  final double rating;
  final String category;
  final String description;
  final String style;
  final String shown;

  const ProductModel({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.discount,
    required this.previousPrice,
    required this.rating,
    required this.category,
    required this.sizes,
    required this.colors,
    required this.description,
    required this.style,
    required this.shown,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      colors: (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as double,
      discount: json['discount'] as int,
      previousPrice: json['previousPrice'] as double,
      rating: json['rating'] as double,
      category: json['category'] as String,
      description: json['description'] as String,
      style: json['style'] as String,
      shown: json['shown'] as String,
    );
  }
}
