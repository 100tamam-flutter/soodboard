import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/models/banner_model.dart';
import 'package:soodboard/src/models/product_model.dart';

abstract class HomeScreenProductsAPI {
  Future<List<BannerModel>> getBanners();

  Future<List<ProductModel>> getFlashSale();

  Future<List<ProductModel>> getMegaSale();

  Future<List<ProductModel>> getRecommendedProducts();
}

class HomeScreenProductsAPIMock implements HomeScreenProductsAPI {
  @override
  Future<List<BannerModel>> getBanners() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await rootBundle.loadString('assets/mock-data/banners.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final bannersList = data['banners'] as List;
    return bannersList.map((e) => BannerModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ProductModel>> getFlashSale() async {
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
    return productsList.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ProductModel>> getMegaSale() async {
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
    return productsList.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ProductModel>> getRecommendedProducts() async {
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
    return productsList.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
