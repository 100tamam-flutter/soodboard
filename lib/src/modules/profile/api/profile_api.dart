
import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/profile_detail.dart';

abstract class ProfileApi {
  Future<ProfileDetail> getProfileDetail() async {
    throw UnimplementedError();
  }
}

class ProfileApiMock implements ProfileApi {
  @override
  Future<ProfileDetail> getProfileDetail() async {
    // Simulate API request delay
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    final response =
    await rootBundle.loadString('assets/mock-data/profile_detail.json');
    final responseBody = jsonDecode(response) as Map<String, dynamic>;
    return ProfileDetail.fromJson(responseBody);
  }
}



