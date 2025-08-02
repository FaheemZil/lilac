import 'auth_service.dart';
import 'chat_service.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  late final AuthService _authService;
  late final ChatService _chatService;
  void init() {
    _authService = AuthService();
    _chatService = ChatService();
  }

  AuthService get authService => _authService;

  ChatService get chatService => _chatService;
}

final serviceLocator = ServiceLocator();
