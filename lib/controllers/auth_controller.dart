import 'package:flutter/foundation.dart';

import '../core/constants/app_constants.dart';
import '../models/auth_response_model.dart';
import '../services/auth_service.dart';
import '../services/service_locator.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = serviceLocator.authService;

  AuthResponseModel? _authResponse;
  // UserModel? _currentUser;
  bool _isLoading = false;

  final String _phoneNumber = AppConstants.testPhoneNumber;
  String? _authToken;

  AuthResponseModel? get authResponse => _authResponse;

  String? get authToken => _authToken;
  bool get isLoading => _isLoading;
  String? get phoneNumber => _phoneNumber;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Send OTP to phone number using the auth service
  Future<void> sendOtp(String phoneNumber) async {
    try {
      setLoading(true);

      await _authService.sendOtp(phoneNumber);
    } finally {
      setLoading(false);
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      setLoading(true);

      final result = await _authService.verifyOtp(
        phoneNumber: _phoneNumber,
        otp: otp,
      );
      _authResponse = result;
      _authToken = _authResponse!.data.attributes.authStatus?.accessToken;
    } finally {
      setLoading(false);
    }
  }
}
