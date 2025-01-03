import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/message_box.dart';
import 'package:flutter_chat/models/message_chat.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/services/chat_service.dart';

class MessageList extends StatefulWidget {
  MessageList({super.key, required this.toUser});
  UserChat toUser;
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  void initState() {
    super.initState();
    setInitMessage();
  }

  final _chatService = ChatService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.toUser.email, FirebaseAuth.instance.currentUser!.email),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if (snapshot.hasError) {
          return Text("Error");
        }
        return ListView(
          reverse: true,
          children: snapshot.data!.docs
              .map(
                (doc) => _buildMessageBox(doc),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageBox(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MessageBox(msgData: MessageChat.fromMap(data));
  }

  void setInitMessage() async {
    await _chatService.initMessage(widget.toUser);
  }
}
