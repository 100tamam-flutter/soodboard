import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/modules/product-details/models/review_model.dart';


abstract class ReviewApi {
  Future<List<ReviewModel>> getReviews();
}

class ReviewApiMock implements ReviewApi {
  @override
  Future<List<ReviewModel>> getReviews() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response =
        await rootBundle.loadString('assets/mock-data/reviews.json');
    final responseBody = jsonDecode(response) as List<dynamic>;
    return responseBody
        .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

}



