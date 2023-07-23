import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:soodboard/src/models/banner_model.dart';
import 'package:soodboard/src/models/banner_model.dart';
import 'package:soodboard/src/models/product_model.dart';

abstract class HomeScreenProductsAPI {
  Future<List<BannerModel>> getBanners() async {
    throw UnimplementedError();
  }
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

    final response =
    await rootBundle.loadString('assets/mock-data/banners.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final bannersList = data['banners'] as List;
    return bannersList
        .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
