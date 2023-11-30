import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/notifications/api/notifications_api.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../models/offer_model.dart';

class OfferProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  OfferProvider(this.context) {
    initOffers();
  }

  late final List<OfferModel> offers;
  final NotificationsApi _notificationsApi = NotificationsApiMock();

  bool loadingOffers = true;

  Future<void> initOffers() async {
    _getOffers();
  }

  Future<void> _getOffers() async {
    loadingOffers = true;
    notifyListeners();
    try {
      offers = await _notificationsApi.getOffers();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingOffers = false;
    notifyListeners();
  }
}
