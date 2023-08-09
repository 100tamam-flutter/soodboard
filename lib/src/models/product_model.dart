import 'package:soodboard/src/models/product_rate_model.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final ProductRateModel? rate;
  final String image;
  final double price;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.rate,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      rate: json['rate'] != null  ? ProductRateModel.fromJson(json['rate'] as Map<String, dynamic>) :null,
      image: json['image'] as String,
      price: double.parse(json['price'].toString()) ,
    );
  }
}
