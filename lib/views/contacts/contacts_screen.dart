import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/controllers/chat_controller.dart';

import '../../controllers/auth_controller.dart';
import '../../core/routes/app_router.dart';
import '../../widgets/common/app_buttons.dart';
import '../../widgets/common/gaps.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late ChatController _chatController;
  late AuthController _authController;

  @override
  void initState() {
    super.initState();
    _chatController = ChatController();
    _authController = context.read<AuthController>();
    _loadContacts();
  }

  void _loadContacts() async {
    final authToken = _authController.authToken;
    await _chatController.loadChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Contacts Directory',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const VGap(16),
            Expanded(
              child: ChangeNotifierProvider.value(
                value: _chatController,
                child: Consumer<ChatController>(
                  builder: (context, chatController, child) {
                    if (chatController.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (chatController.chats.isEmpty) {
                      return const Center(child: Text('No chats found'));
                    }

                    return ListView.builder(
                      itemCount: chatController.chats.length,
                      itemBuilder: (context, index) {
                        final chat = chatController.chats[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              backgroundImage:
                                  chat.attributes?.profilePhotoUrl != null
                                  ? NetworkImage(
                                      chat.attributes?.profilePhotoUrl ?? '',
                                    )
                                  : null,
                              child: chat.attributes?.profilePhotoUrl == null
                                  ? Text(
                                      chat.attributes?.name?[0].toUpperCase() ??
                                          '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : null,
                            ),
                            title: Text(chat.attributes?.name ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chat.attributes?.phone ?? ''),
                                if (chat.attributes?.isActive ?? false)
                                  const Text(
                                    'Online',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.chat),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRouter.chat,
                                  arguments: chat,
                                );
                              },
                            ),
                            onTap: () {
                              _showContactDetails(context, chat);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const VGap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppElevatedButton(
                    text: 'Messages',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.messages);
                    },
                  ),
                ),
                const HGap(16),
                Expanded(
                  child: AppElevatedButton(
                    text: 'Phone Auth',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.phone);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showContactDetails(BuildContext context, dynamic contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(contact.attributes.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone: ${contact.attributes.phone}'),
            const VGap(8),
            Text('Email: ${contact.attributes.email}'),
            const VGap(8),
            Text('Age: ${contact.attributes.age ?? "N/A"}'),
            const VGap(8),
            Text(
              'Status: ${contact.attributes.isOnline ? "Online" : "Offline"}',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                AppRouter.chat,
                arguments: contact.id,
              );
            },
            child: const Text('Start Chat'),
          ),
        ],
      ),
    );
  }
}
