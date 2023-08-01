import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/modules/product-details/models/product_detail_model.dart';

abstract class ProductDetailAPI {
  Future<ProductDetailModel> getProductDetail() async {
    throw UnimplementedError();
  }
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
}
