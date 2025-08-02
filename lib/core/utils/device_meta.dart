import 'dart:io';
import 'package:flutter/foundation.dart';

class DeviceMeta {
  static Map<String, dynamic> getDeviceMeta() {
    return {
      'type': _getDeviceType(),
      'device-name': _getDeviceName(),
      'device-os-version': _getOSVersion(),
      'browser': _getBrowser(),
      'browser_version': _getBrowserVersion(),
      'user-agent': _getUserAgent(),
      'screen_resolution': _getScreenResolution(),
      'language': _getLanguage(),
    };
  }

  static String _getDeviceType() {
    if (kIsWeb) return 'web';
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    if (Platform.isWindows) return 'windows';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isLinux) return 'linux';
    return 'unknown';
  }

  static String _getDeviceName() {
    if (kIsWeb) return 'Web Browser';
    if (Platform.isAndroid) return 'Android Device';
    if (Platform.isIOS) return 'iOS Device';
    if (Platform.isWindows) return 'Windows Device';
    if (Platform.isMacOS) return 'macOS Device';
    if (Platform.isLinux) return 'Linux Device';
    return 'Unknown Device';
  }

  static String _getOSVersion() {
    if (kIsWeb) return 'Web';
    return Platform.operatingSystemVersion;
  }

  static String _getBrowser() {
    if (kIsWeb) return 'Flutter Web';
    return 'Mobile App';
  }

  static String _getBrowserVersion() {
    if (kIsWeb) return '1.0.0';
    return '1.0.0';
  }

  static String _getUserAgent() {
    if (kIsWeb) {
      return 'Flutter Web App';
    }
    return 'Flutter Mobile App';
  }

  static String _getScreenResolution() {
    // This would need to be implemented with MediaQuery in the context
    // For now, returning a default value
    return '1080x1920';
  }

  static String _getLanguage() {
    return Platform.localeName;
  }
}