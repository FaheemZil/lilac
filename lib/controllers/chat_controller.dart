import 'package:flutter/foundation.dart';
import 'package:test_project/models/chat_messages_model.dart';

import '../models/message_model.dart';
import '../services/chat_service.dart';
import '../services/service_locator.dart';

class ChatController extends ChangeNotifier {
  final ChatService _chatService = serviceLocator.chatService;
  final List<Customer> _chatData = [];
  List<Customer> _chats = [];
  List<MessageModel> _messages = [];
  bool _isLoading = false;

  List<Customer> get chats => _chats;
  List<MessageModel> get messages => _messages;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Load all chats using the chat service
  Future<void> loadChats() async {
    try {
      setLoading(true);

      final response = await _chatService.loadChats();
      _chatData
        ..clear()
        ..addAll(response.data ?? []);
      _chats = _chatData;
    } finally {
      setLoading(false);
    }
  }

  Future<void> loadMessages({required String receiverId}) async {
    try {
      setLoading(true);

      _messages = await _chatService.loadMessages(receiverId);
    } finally {
      setLoading(false);
    }
  }

  Future<void> searchUsers(String query) async {
    _chats = _chatData
        .where(
          (element) =>
              element.attributes?.name?.toLowerCase().contains(
                query.toLowerCase(),
              ) ??
              false,
        )
        .toList();
    notifyListeners();
  }

  void clearMessages() {
    _messages = [];
    notifyListeners();
  }
}
