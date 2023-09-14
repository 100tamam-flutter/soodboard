class Urls {
  static const mainUri = "https://fakestoreapi.com";


  /// Products:
  static const getProducts = '$mainUri/products/';
  static getProductDetail(String id) => '$mainUri/products/$id';


}
