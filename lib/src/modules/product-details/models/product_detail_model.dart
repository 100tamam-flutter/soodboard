
class ProductDetailModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final RatingModel ratingModel;

  const ProductDetailModel({
    required this.title,
    required this.price,
    required this.ratingModel,
    required this.category,
    required this.description,
    required this.image,
    required this.id,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String,
        description: json['description'] as String,
        category: json['category'] as String,
        price: json['price'] as double,
        ratingModel: RatingModel.fromJson(json['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  const RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      count: json['count'] as int,
      rate: json['rate'] as double,
    );
  }
}
