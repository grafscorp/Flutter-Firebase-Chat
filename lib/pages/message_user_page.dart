import 'package:flutter/material.dart';
import 'package:flutter_chat/components/input_conteiner.dart';
import 'package:flutter_chat/components/message_box.dart';

class MessageUserPage extends StatefulWidget {
  const MessageUserPage({super.key});

  @override
  State<MessageUserPage> createState() => _MessageUserPageState();
}

class _MessageUserPageState extends State<MessageUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            foregroundImage: AssetImage("assets/images/template_avatar.png"),
          ),
        ),
        title: Text("Username"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MessageBox(
            time: "20:00",
          ),
          InputConteiner(),
        ],
      ),
    );
  }
}
