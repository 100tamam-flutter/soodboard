import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/notifications/api/notifications_api.dart';
import 'package:soodboard/src/modules/notifications/models/notification_status.dart';
import 'package:vrouter/vrouter.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';

class NotificationsProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  NotificationsProvider(this.context) {
    initNotificationStatus();
  }

  late final NotificationStatus notificationStatus;
  final NotificationsApi _notificationsApi = NotificationsApiMock();

  bool loadingStatus = true;

  Future<void> initNotificationStatus() async {
    _getNotificationStatus();
  }

  Future<void> _getNotificationStatus() async {
    loadingStatus = true;
    notifyListeners();
    try {
      notificationStatus = await _notificationsApi.getStatus();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingStatus = false;
    notifyListeners();
  }

  void goToOffersScreen() {
    context.vRouter.to('offers');
  }

  void goToFeedPage() {
    context.vRouter.to('feed');
  }

  void goToActivityPage() {
    context.vRouter.to('activity');
  }
}
