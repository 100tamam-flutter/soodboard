import 'package:flutter/material.dart';
import 'package:soodboard/src/modules/notifications/api/notifications_api.dart';

import '../../../core/providers/safe_provider.dart';
import '../../../models/error_template.dart';
import '../../../utils/error_handler.dart';
import '../models/activity_model.dart';

class ActivityProvider extends SafeProvider with ErrorHandler {
  final BuildContext context;

  ActivityProvider(this.context) {
    initActivities();
  }

  late final List<ActivityModel> activities;
  final NotificationsApi _notificationsApi = NotificationsApiMock();

  bool loadingActivities = true;

  Future<void> initActivities() async {
    _getActivities();
  }

  Future<void> _getActivities() async {
    loadingActivities = true;
    notifyListeners();
    try {
      activities = await _notificationsApi.getActivities();
    } on ApiError catch (e) {
      showError(context, e);
    }
    loadingActivities = false;
    notifyListeners();
  }
}
