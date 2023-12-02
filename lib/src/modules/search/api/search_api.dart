import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/models/product_model.dart';

abstract class SearchApi {
  Future<List<ProductModel>> searchProducts({required String searchText}) async {
    throw UnimplementedError();
  }
}

class SearchApiMock implements SearchApi {
  @override
  Future<List<ProductModel>> searchProducts({required String searchText}) async {
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
    return productsList
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .where((element) => element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
