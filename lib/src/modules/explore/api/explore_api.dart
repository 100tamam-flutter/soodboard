import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/modules/explore/models/category_model.dart';

import '../../../constants/urls.dart';
import '../../../core/api/core_api.dart';
import '../../../models/error_template.dart';

abstract class ExploreAPI {
  Future<List<CategoryModel>> getcategories() async {
    throw UnimplementedError();
  }
}

class ExploreAPIMock implements ExploreAPI {
  @override
  Future<List<CategoryModel>> getcategories() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response =
    await rootBundle.loadString('assets/mock-data/categories.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final categoriesList = data['categories'] as List;
    return categoriesList
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class ExploreApiImp implements ExploreAPI {

  final _coreApi = CoreApi();
  @override
  Future<List<CategoryModel>> getcategories() async {
    final response = await _coreApi.get(
      Uri.parse(
        Urls.getcategories,
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
    return responseBody.map((e) => CategoryModel.fromJson(e)).toList();
  }

}