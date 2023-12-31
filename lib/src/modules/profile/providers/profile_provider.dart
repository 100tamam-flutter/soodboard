import 'package:flutter/material.dart';
import 'package:soodboard/src/core/providers/safe_provider.dart';
import 'package:soodboard/src/modules/profile/api/profile_api.dart';
import 'package:soodboard/src/modules/profile/models/profile_detail.dart';
import 'package:soodboard/src/utils/error_handler.dart';

import '../../../models/error_template.dart';

class ProfileProvider extends SafeProvider with ErrorHandler{
  final BuildContext context;
  ProfileProvider(this.context){
    getProfileDetail();
  }

  final _profileApi = ProfileApiMock();
  late final ProfileDetail profileDetail;
  bool isLoading = true;

  Future<void> getProfileDetail() async {
    isLoading = true;
    notifyListeners();
    try {
      profileDetail = await _profileApi.getProfileDetail();
    } on ApiError catch (e) {
      showError(context, e);
    }
    isLoading = false;
    notifyListeners();
  }

}
