class ApiEndpoints {
  static const String baseUrl = 'https://test.myfliqapp.com/api/v1';

  static const String sendOtpEndpoint =
      '/auth/registration-otp-codes/actions/phone/send-otp';
  static const String verifyOtpEndpoint =
      '/auth/registration-otp-codes/actions/phone/verify-otp';
  static const String messagesEndpoint =
      '/chat/chat-messages/queries/contact-users';
  static String chatEndpoint(String receiverId) =>
      '/chat/chat-messages/queries/chat-between-users/$receiverId/81';
}
