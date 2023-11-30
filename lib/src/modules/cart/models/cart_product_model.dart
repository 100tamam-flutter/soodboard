
class CartProductModel {
  final String id;
  final String productName;
  final String image;
  int quantity;
  final double price;

  CartProductModel({
    required this.id,
    required this.image,
    required this.productName,
    required this.quantity,
    required this.price,
  });

}

