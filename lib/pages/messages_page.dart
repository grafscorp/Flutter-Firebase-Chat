import 'package:flutter/material.dart';
import 'package:flutter_chat/components/loading_chat_indicator.dart';
import 'package:flutter_chat/components/message_list_tile.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/services/chat_service.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Messages"),
        ),
        body: FutureBuilder(
          future: getUsersChat(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingChatIndicator(),
              );
            }

            List<UserChat> usersChat = snapshot.data!;

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.surface,
                      const Color.fromARGB(251, 50, 20, 64)
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter),
              ),
              constraints: BoxConstraints(maxWidth: 700),
              child: ListView.builder(
                itemCount: usersChat.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MessageListTile(user: usersChat[index]),
                      Divider()
                    ],
                  );
                },
              ),
            );
          },
        ));
  }

  Future<List<UserChat>> getUsersChat() async {
    List<dynamic> userEmails = await ChatService.getUserChat();
    if (userEmails.isEmpty) return [];
    List<UserChat> usersChat = [];
    for (var _userEmail in userEmails) {
      usersChat.add(
        await UserChat.parseUserFirebaseEmail(_userEmail),
      );
    }
    return usersChat;
  }
}
