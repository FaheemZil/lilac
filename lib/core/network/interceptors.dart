import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/controllers/auth_controller.dart';
import 'package:test_project/core/routes/app_router.dart';
import 'package:test_project/main.dart';
import 'package:test_project/models/error_response.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authController = currentContext.read<AuthController>();
    final authToken = authController.authToken;
    print('authToken: $authToken');
    options.headers['Authorization'] = 'Bearer $authToken';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type != DioExceptionType.cancel &&
        err.type != DioExceptionType.connectionError) {
      if (err.response?.statusCode == 401) {
        Navigator.pushNamedAndRemoveUntil(
          currentContext,
          AppRouter.phone,
          (route) => false,
        );
        dialogHandler('Unauthorized', 'Please login to continue');
      }
      try {
        final errorResponse = ErrorResponse.fromJson(err.response?.data);
        dialogHandler('Error', errorResponse.errorMessage);
      } catch (e) {
        dialogHandler('Error', 'Unknown error');
      }
    }
    handler.next(err);
  }

  void dialogHandler(String title, String content) {
    showDialog(
      context: currentContext,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
