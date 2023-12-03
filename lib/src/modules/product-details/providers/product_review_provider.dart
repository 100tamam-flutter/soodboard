import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/product-details/api/review_api.dart';
import 'package:vrouter/vrouter.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../models/review_model.dart';

class ProductReviewsProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  ProductReviewsProvider({required this.context, required this.productId}) {
    getReviews();
  }

  final String productId;

  bool loadingReviews = false;
  late List<ReviewModel> reviews;
  final ReviewApi _reviewApi = ReviewApiMock();

  Future<void> getReviews() async {
    loadingReviews = true;
    notifyListeners();
    try {
      reviews = await _reviewApi.getReviews();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingReviews = false;
    notifyListeners();
  }

  void goToAddReview() {
    context.vRouter.to('/add_review/$productId');
  }
}
