import 'package:flutter/material.dart';
import 'package:soodboard/src/core/providers/safe_provider.dart';
import 'package:soodboard/src/modules/profile/api/profile_api.dart';
import 'package:soodboard/src/modules/profile/models/profile_detail.dart';
import 'package:soodboard/src/utils/error_handler.dart';


class PhoneNumberProvider extends SafeProvider with ErrorHandler{
  final BuildContext context;
  final String phoneNumber;
  PhoneNumberProvider(this.context, this.phoneNumber,);

  final _profileApi = ProfileApiMock();

  late final ProfileDetail profileDetail;
  bool isLoading = true;


}