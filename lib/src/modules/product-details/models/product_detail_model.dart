
class ProductDetailModel {
  final String id;
  final String title;
  final String image1;
  final String image3;
  final String image2;
  final String price;
  final String before;
  final String offer;
  final String description;


  const ProductDetailModel({
    required this.title,
    required this.price,
    required this.image1,
    required this.id,
    required this.image2,
    required this.image3,
    required this.before,
    required this.offer,
    required this.description,


  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
        id: json['id'] as String,
        title: json['title'] as String,
        image1: json['image'] as String,
      image2: json['image'] as String,
      image3: json['image'] as String,
        price: json['price'] as String,
      before: json['price'] as String,
      offer: json['price'] as String,
      description: json['image'] as String,




    );
  }

  get isEmpty => null;

}

