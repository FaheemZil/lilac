import 'package:test_project/models/chat_messages_model.dart';
import 'package:test_project/models/message_model.dart';

import '../core/network/dio_client.dart';
import 'api_endpoints.dart';

class ChatService {
  static final ChatService _instance = ChatService._internal();
  factory ChatService() => _instance;
  ChatService._internal();

  /// Load all chat conversations for the current user
  Future<ChatMessagesResponse> loadChats() async {
    final response = await DioClient.instance.get(
      ApiEndpoints.messagesEndpoint,
    );

    return ChatMessagesResponse.fromJson(response.data);
  }

  Future<List<MessageModel>> loadMessages(String receiverId) async {
    final response = await DioClient.instance.get(
      ApiEndpoints.chatEndpoint(receiverId),
    );

    final List<dynamic> data = response.data['messages'] ?? [];
    final messages = data.map((json) => MessageModel.fromJson(json)).toList();
    return messages;
  }
}
