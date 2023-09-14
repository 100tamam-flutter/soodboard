import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/product-details/api/review_api.dart';
import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../api/product_detail_api.dart';
import '../models/product_detail_model.dart';
import '../models/review_model.dart';

class ProductDetailProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  ProductDetailProvider(this.context) {
    initProductDetail();
  }
  late final ProductDetailModel productDetail;
  late final List<ReviewModel> reviews;
  final ProductDetailAPI _productDetailAPI = ProductDetailAPIMock();
  final ReviewApi _reviewApi = ReviewApiMock();

  bool loadingProductDetail = true;
  bool loadingReviews = true;

  get isLoading => loadingProductDetail || loadingReviews;

  Future<void> initProductDetail() async {
    getProductDetail();
    getReviews();
  }

  Future<void> getProductDetail() async {
    loadingProductDetail = true;
    notifyListeners();
    try {
      productDetail = await _productDetailAPI.getProductDetail();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingProductDetail = false;
    notifyListeners();
  }

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

  int? selectedSize;

  selectSize(int sizeIndex) {
    selectedSize = sizeIndex;
    notifyListeners();
  }

  int? selectedColor;

  selectColor(int colorIndex) {
    selectedColor = colorIndex;
    notifyListeners();
  }
}

