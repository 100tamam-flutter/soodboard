
class ProductDetailModel {
  final String id;
  final String title;
  final String image1;
  final String image3;
  final String image2;
  final double price;
  final double before;
  final double offer;
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
        image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
        price: json['price'] as double,
      before: json['before'] as double,
      offer: json['offer'] as double,
      description: json['description'] as String,




    );
  }

  get isEmpty => null;

}

