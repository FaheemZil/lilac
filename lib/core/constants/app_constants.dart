class AppConstants {
  static const String appName = 'Fliq Dating';

  // API endpoints
  static const String baseUrl = 'https://test.myfliqapp.com/api/v1';
  static const String sendOtpEndpoint = '/auth/registration-otp-codes/actions/phone/send-otp';
  static const String verifyOtpEndpoint = '/auth/registration-otp-codes/actions/phone/verify-otp';
  static const String contactUsersEndpoint = '/chat/chat-messages/queries/contact-users';
  static const String chatMessagesEndpoint = '/chat/chat-messages/queries/chat-between-users';

  // Test credentials
  static const String testPhoneNumber = '+918087808780';
  static const String testOtp = '111111';

  // Route names
  static const String splashRoute = '/';
  static const String phoneRoute = '/phone';
  static const String otpRoute = '/otp';
  static const String messagesRoute = '/messages';
  static const String chatRoute = '/chat';

  // Asset paths
  static const String backgroundImage = 'assets/images/image.png';
  static const String logoPath = 'assets/images/logo.png';

  // Validation
  static const int otpLength = 6;
  static const int phoneNumberMinLength = 10;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double largePadding = 24.0;
  static const double smallPadding = 8.0;
  static const double borderRadius = 12.0;
  static const double buttonHeight = 56.0;
}
