import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/notifications/api/notifications_api.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../models/feed_model.dart';

class FeedProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  FeedProvider(this.context) {
    initFeeds();
  }

  late final List<FeedModel> feeds;
  final NotificationsApi _notificationsApi = NotificationsApiMock();

  bool loadingFeeds = true;

  Future<void> initFeeds() async {
    _getFeeds();
  }

  Future<void> _getFeeds() async {
    loadingFeeds = true;
    notifyListeners();
    try {
      feeds = await _notificationsApi.getFeed();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingFeeds = false;
    notifyListeners();
  }
}
