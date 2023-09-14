import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();

  late SharedPreferences _storage;

  static final Storage instance = Storage._();

  Future<void> initialize() async {
    _storage = await SharedPreferences.getInstance();
  }

  String? get phoneNumber => _storage.getString('phoneNumber');

  Future<bool> setPhoneNumber(final String value) async {
    final isSaved = await _storage.setString('phoneNumber', value);
    return isSaved;
  }

  String? get accessToken => _storage.getString('accessToken');

  Future<bool> setAccessToken(final String access) async {
    return _storage.setString('accessToken', access);
  }

  String? get refreshToken => _storage.getString('refreshToken');

  Future<bool> setRefreshToken(final String refresh) async {
    return _storage.setString('refreshToken', refresh);
  }

  bool? get registerCompleted => _storage.getBool('registerCompleted');

  void setIsRegisterCompleted(final bool registerCompleted) {
    _storage.setBool('registerCompleted', registerCompleted);
  }

  String? get otpId => _storage.getString('otpId');

  Future<bool> setOtpId(final String otpId) async {
    final isSave = await _storage.setString('otpId', otpId);
    return isSave;
  }

  String? get profilePic => _storage.getString('profilePic');

  void setProfilePic(final String path) {
    _storage.setString('profilePic', path);
  }

  void removeProfilePic() {
    _storage.remove('profilePic');
  }

  bool get isTutorialShown => _storage.getBool('tutorial') ?? false;

  Future<void> setTutorialShow() async {
    await _storage.setBool('tutorial', true);
  }

  bool get isOnboardingShown => _storage.getBool('onboarding') ?? false;

  Future<void> setOnboardingShow() async {
    await _storage.setBool('onboarding', true);
  }

  bool hasProfilePic() {
    return _storage.containsKey('profilePic');
  }

  Future<bool> logout() async {
    bool response = true;
    response &= await _storage.remove('accessToken');
    response &= await _storage.remove('refreshToken');
    return response;
  }
}
