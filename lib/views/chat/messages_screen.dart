import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/core/routes/app_router.dart';

import '../../controllers/chat_controller.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/common/app_text_field.dart';
import '../../widgets/common/gaps.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final _searchController = TextEditingController();
  final names = [
    'Christina',
    'Patricia',
    'Celestine',
    'Celestine',
    'Elizabeth',
  ];
  final images = [
    'assets/images/Ellipse 30.png',
    'assets/images/Ellipse 30-1.png',
    'assets/images/Ellipse 30-2.png',
    'assets/images/Ellipse 30-3.png',
    'assets/images/Ellipse 30-4.png',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatController>().loadChats();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        title: Text(
          'Messages',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Story Section
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 70,
                  margin: const EdgeInsets.only(
                    right: AppConstants.defaultPadding,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppTheme.primaryColor.withOpacity(0.1),
                                child: Icon(
                                  Icons.person,
                                  color: AppTheme.primaryColor,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const VGap(4),
                      Text(
                        names[index],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: AppTextField(
              prefixIcon: const Icon(
                Icons.search,
                color: AppTheme.textSecondary,
              ),
              controller: _searchController,
              hintText: 'Search',
              onChanged: (value) {
                context.read<ChatController>().searchUsers(value);
              },
            ),
          ),

          // Chat Section Header
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Chat',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const VGap(16),

          // Chat List
          Expanded(
            child: Consumer<ChatController>(
              builder: (context, chatController, child) {
                if (chatController.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryColor,
                    ),
                  );
                }

                return chatController.chats.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding,
                        ),
                        itemCount: chatController.chats.length,
                        itemBuilder: (context, index) {
                          final chat = chatController.chats[index];
                          return ListTile(
                            title: Text(chat.attributes?.name ?? ''),
                            subtitle: Text(chat.attributes?.email ?? ''),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                chat.attributes?.profilePhotoUrl ?? '',
                              ),
                            ),
                            trailing: Text(
                              '12:00',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRouter.chat,
                              arguments: {
                                'receiverId': '${chat.attributes?.authUserId}',
                              },
                            ),
                          );
                        },
                      )
                    : const Center(child: Text('No messages yet'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
