import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/models/product_model.dart';

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
