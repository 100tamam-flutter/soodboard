import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:soodboard/src/modules/notifications/models/activity_model.dart';
import 'package:soodboard/src/modules/notifications/models/feed_model.dart';
import 'package:soodboard/src/modules/notifications/models/offer_model.dart';

import '../models/notification_status.dart';

abstract class NotificationsApi {
  Future<List<OfferModel>> getOffers();

  Future<List<FeedModel>> getFeed();

  Future<List<ActivityModel>> getActivities();

  Future<NotificationStatus> getStatus();
}

class NotificationsApiMock implements NotificationsApi {
  @override
  Future<List<OfferModel>> getOffers() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await rootBundle.loadString('assets/mock-data/offers.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final notificationsList = data['offers'] as List;
    return notificationsList.map((e) => OfferModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<FeedModel>> getFeed() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await rootBundle.loadString('assets/mock-data/feeds.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final feedList = data['feeds'] as List;
    return feedList.map((e) => FeedModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ActivityModel>> getActivities() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await rootBundle.loadString('assets/mock-data/activities.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    final activitiesList = data['feeds'] as List;
    return activitiesList.map((e) => ActivityModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<NotificationStatus> getStatus() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response = await rootBundle.loadString('assets/mock-data/notification_status.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    final data = responseBody['data'] as Map<String, dynamic>;
    return NotificationStatus.fromJson(data);
  }
}
