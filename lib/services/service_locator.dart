import 'auth_service.dart';
import 'chat_service.dart';

/// Service locator for managing service instances
class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  // Service instances
  late final AuthService _authService;
  late final ChatService _chatService;

  /// Initialize all services
  void init() {
    _authService = AuthService();
    _chatService = ChatService();
  }

  /// Get authentication service instance
  AuthService get authService => _authService;

  /// Get chat service instance
  ChatService get chatService => _chatService;
}

/// Global service locator instance
final serviceLocator = ServiceLocator();