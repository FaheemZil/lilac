import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:test_project/core/routes/app_router.dart';

import '../../controllers/auth_controller.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/common/app_buttons.dart';
import '../../widgets/common/gaps.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  String _currentOtp = '';

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _handleVerify() async {
    if (_currentOtp.length == AppConstants.otpLength) {
      final authController = context.read<AuthController>();

      await authController.verifyOtp(_currentOtp);

      if (mounted) {
        Navigator.pushNamed(context, AppRouter.messages);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid OTP'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  void _handleResend() async {
    final authController = context.read<AuthController>();
    if (authController.phoneNumber != null) {
      await authController.sendOtp(authController.phoneNumber!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP resent successfully!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.largePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VGap(24),

              // Title
              Text(
                'Enter your verification\ncode',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),

              const VGap(24),

              // Phone Number Display
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return Row(
                    children: [
                      Text(
                        authController.phoneNumber ?? '+91 98745 61230',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const HGap(8),
                      AppTextButton(
                        text: 'Edit',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  );
                },
              ),

              const VGap(48),

              // OTP Input Fields
              PinCodeTextField(
                appContext: context,
                length: AppConstants.otpLength,
                controller: _otpController,
                keyboardType: TextInputType.number,
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadius,
                  ),
                  fieldHeight: 56,
                  fieldWidth: 48,
                  activeFillColor: AppTheme.surfaceColor,
                  inactiveFillColor: AppTheme.surfaceColor,
                  selectedFillColor: AppTheme.surfaceColor,
                  activeColor: AppTheme.primaryColor,
                  inactiveColor: AppTheme.borderColor,
                  selectedColor: AppTheme.primaryColor,
                  borderWidth: 2,
                ),
                enableActiveFill: true,
                animationType: AnimationType.fade,
                animationDuration: const Duration(milliseconds: 300),
                onChanged: (value) {
                  setState(() {
                    _currentOtp = value;
                  });
                },
                onCompleted: (value) {
                  _currentOtp = value;
                  _handleVerify();
                },
              ),

              const VGap(24),

              // Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get anything? No worries, let's try again.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),

              const VGap(8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _handleResend,
                    child: Text(
                      'Resent',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Verify Button
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: AppConstants.buttonHeight,
                    child: ElevatedButton(
                      onPressed:
                          authController.isLoading ||
                              _currentOtp.length != AppConstants.otpLength
                          ? null
                          : _handleVerify,
                      child: authController.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text('Verify'),
                    ),
                  );
                },
              ),

              const VGap(24),
            ],
          ),
        ),
      ),
    );
  }
}
