class ProductDetailModel {
  final String title;
  final String image1;
  final String image2;
  final String image3;
  final double price;
  final RatingModel ratingModel;

  const ProductDetailModel(
      {required this.title,
      required this.image1,
      required this.image3,
      required this.image2,
      required this.price,
      required this.ratingModel});

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
        title: json['title'] as String,
        image1: json['image1'] as String,
        image2: json['image2'] as String,
        image3: json['image3'] as String,
        price: json['price'] as double,
        ratingModel: RatingModel.fromJson(json['rating']));
  }
}

class RatingModel {
  final String rate;
  final String count;

  const RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      count: json['count'] as String,
      rate: json['rate'] as String,
    );
  }
}
