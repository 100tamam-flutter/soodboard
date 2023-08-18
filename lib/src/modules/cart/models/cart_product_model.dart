class CartProductModel {
  final String productName;
  final String image;
  final int quantity;
  final int price;

  const CartProductModel({
    required this.image,
    required this.productName,
    required this.quantity,
    required this.price,
  });
}
