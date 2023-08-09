import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:soodboard/src/models/product_model.dart';

import '../../../constants/urls.dart';
import '../../../core/api/core_api.dart';
import '../../../models/error_template.dart';

abstract class FavoriteProductsAPI {
  Future<List<ProductModel>> getProducts() async {
    throw UnimplementedError();
  }
}

class FavoriteProductsAPIMock implements FavoriteProductsAPI {
  @override
  Future<List<ProductModel>> getProducts() async {
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

class FavoriteProductsApiImp implements FavoriteProductsAPI {

  final _coreApi = CoreApi();
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _coreApi.get(
      Uri.parse(
        Urls.getProducts,
      ),
    );
    if (response == null) {
      throw ApiError(message: 'مشکل در ارتباط با سرور');
    }
    final responseBody =
    jsonDecode(utf8.decode(response.bodyBytes)) as List;
    if (response.statusCode != 200) {
      throw ApiError(message: 'خطا');
    }
    return responseBody.map((e) => ProductModel.fromJson(e)).toList();
  }

}
