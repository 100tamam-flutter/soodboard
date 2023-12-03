import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/modules/product-details/models/product_detail_model.dart';

import '../../../models/product_model.dart';

abstract class ProductDetailAPI {
  Future<ProductDetailModel> getProductDetail(String id);

  Future<List<ProductModel>> getRelatedProducts(String id);
}

class ProductDetailAPIMock implements ProductDetailAPI {
  @override
  Future<ProductDetailModel> getProductDetail(String id) async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await rootBundle.loadString('assets/mock-data/products.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final productsListDynamic = data['products'] as List;
    final productsList = productsListDynamic.map((e) => ProductDetailModel.fromJson(e as Map<String, dynamic>)).toList();
    return productsList.singleWhere((element) => element.id == id);
  }

  @override
  Future<List<ProductModel>> getRelatedProducts(String id) async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await rootBundle.loadString('assets/mock-data/products.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final productsList = data['products'] as List;
    return productsList.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).where((element) => element.id != id).toList();
  }
}
