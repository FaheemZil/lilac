import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'controllers/chat_controller.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'services/service_locator.dart';

void main() {
  // Initialize services
  serviceLocator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Fliq Dating',
        theme: AppTheme.lightTheme,
        routes: AppRouter.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

final navigatorKey = GlobalKey<NavigatorState>();
BuildContext get currentContext => navigatorKey.currentContext!;
