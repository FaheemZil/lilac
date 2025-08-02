import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/core/routes/app_router.dart';

import '../../controllers/auth_controller.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/common/app_buttons.dart';
import '../../widgets/common/gaps.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        final authController = context.read<AuthController>();
        if (authController.isLoggedIn) {
          Navigator.pushNamed(context, AppRouter.contacts);
        } else {
          Navigator.pushNamed(context, AppRouter.phone);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppConstants.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.largePadding),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // Logo
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),

                  const VGap(24),

                  // App Title
                  Text(
                    'Connect. Meet. Love.',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const VGap(8),

                  Text(
                    'With ${AppConstants.appName}',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(flex: 3),

                  // Social Login Buttons
                  Column(
                    children: [
                      // Google Sign In
                      SocialButton.google(
                        text: 'Sign in with Google',
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRouter.phone),
                      ),

                      const VGap(16),

                      // Facebook Sign In
                      SocialButton.facebook(
                        text: 'Sign in with Facebook',
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRouter.phone),
                      ),

                      const VGap(16),

                      // Phone Sign In
                      SocialButton.phone(
                        text: 'Sign in with phone number',
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRouter.phone),
                      ),

                      const VGap(16),

                      // Direct to Contacts (for testing)
                      AppElevatedButton(
                        text: 'Go to Contacts',
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRouter.contacts),
                      ),
                    ],
                  ),

                  const VGap(24),

                  // Terms and Privacy
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                      children: const [
                        TextSpan(text: 'By signing up, you agree to our '),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: '. See how we use your data in our '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
