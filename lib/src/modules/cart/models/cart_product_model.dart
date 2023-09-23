class CartProductModel {
  final String productName;
  final String image;
  final int quantity;
  final int price;
  final String size;
  final String color;


  const CartProductModel( {
    required this.image,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.color,
    required this.size,

  });
}
