import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/modules/product-details/models/product_detail_model.dart';
import '../../../models/product_model.dart';

abstract class ProductDetailAPI {
  Future<ProductDetailModel> getProductDetail();

  Future<List<ProductModel>> getRelatedProducts();

}

class ProductDetailAPIMock implements ProductDetailAPI {
  @override
  Future<ProductDetailModel> getProductDetail() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );



    final response =
    await rootBundle.loadString('assets/mock-data/product_detail.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;


    return ProductDetailModel.fromJson(responseBody);
  }

  @override
  Future<List<ProductModel>> getRelatedProducts() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response =
    await rootBundle.loadString('assets/mock-data/products.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final productsList = data['products'] as List;
    return productsList
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

}

//
// class ProductDetailAPIMock implements ProductDetailAPIMock {
//
//   final _coreApi = CoreApi();
//   @override
//   Future<List<ProductModel>> getProducts() async {
//     final response = await _coreApi.get(
//       Uri.parse(
//         Urls.getProducts,
//       ),
//     );
//     if (response == null) {
//       throw ApiError(message: 'مشکل در ارتباط با سرور');
//     }
//     final responseBody =
//     jsonDecode(utf8.decode(response.bodyBytes)) as List;
//     if (response.statusCode != 200) {
//       throw ApiError(message: 'خطا');
//     }
//     return responseBody.map((e) => ProductModel.fromJson(e)).toList();
//   }
//
//   @override
//   Future<ProductDetailModel> getProductDetail(String id) async {
//     final response = await _coreApi.get(
//       Uri.parse(
//         Urls.getProductDetail(id),
//       ),
//     );
//     if (response == null) {
//       throw ApiError(message: 'مشکل در ارتباط با سرور');
//     }
//     final responseBody =
//     jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
//     print(responseBody);
//     if (response.statusCode != 200) {
//       throw ApiError(message: 'خطا');
//     }
//     return ProductDetailModel.fromJson(responseBody);
//   }
//
// }
