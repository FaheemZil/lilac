import 'package:flutter/material.dart';

import '../../views/auth/otp_screen.dart';
import '../../views/auth/phone_screen.dart';
import '../../views/chat/chat_screen.dart';
import '../../views/chat/messages_screen.dart';
import '../../views/contacts/contacts_screen.dart';
import '../../views/splash/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String phone = '/phone';
  static const String otp = '/otp';
  static const String messages = '/messages';
  static const String chat = '/chat';
  static const String contacts = '/contacts';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    phone: (context) => const PhoneScreen(),
    otp: (context) => const OtpScreen(),
    messages: (context) => const MessagesScreen(),
    chat: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      return ChatScreen(receiverId: args['receiverId'] as String);
    },
    contacts: (context) => const ContactsScreen(),
  };

  static String get initialRoute => splash;
}
