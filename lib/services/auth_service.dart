import 'package:test_project/services/api_endpoints.dart';

import '../core/network/dio_client.dart';
import '../core/utils/device_meta.dart';
import '../models/auth_response_model.dart';
import '../models/otp_response_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  Future<OtpResponseModel> sendOtp(String phoneNumber) async {
    final response = await DioClient.instance.post(
      ApiEndpoints.sendOtpEndpoint,
      data: {
        "data": {
          "type": "registration_otp_codes",
          "attributes": {"phone": phoneNumber},
        },
      },
    );

    return OtpResponseModel.fromJson(response.data);
  }

  Future<AuthResponseModel> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    final response = await DioClient.instance.post(
      ApiEndpoints.verifyOtpEndpoint,
      data: {
        "data": {
          "type": "registration_otp_codes",
          "attributes": {
            "phone": phoneNumber,
            "otp": int.parse(otp),
            "device_meta": DeviceMeta.getDeviceMeta(),
          },
        },
      },
    );

    return AuthResponseModel.fromJson(response.data);
  }
}
