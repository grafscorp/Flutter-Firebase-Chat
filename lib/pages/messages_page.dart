import 'package:flutter/material.dart';
import 'package:flutter_chat/mock/firebase_messages_mock.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: ListView.builder(
        itemCount: messages_list_mock.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [messages_list_mock[index], Divider()],
          );
        },
      ),
    );
  }
}
