import 'package:flutter/material.dart';
import 'package:flutter_chat/components/input_conteiner.dart';
import 'package:flutter_chat/components/message_list.dart';
import 'package:flutter_chat/models/user_chat.dart';

class MessageUserPage extends StatefulWidget {
  MessageUserPage({
    super.key,
    required this.toUser,
  });
  UserChat toUser;

  @override
  State<MessageUserPage> createState() => _MessageUserPageState();
}

class _MessageUserPageState extends State<MessageUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded),
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                foregroundImage:
                    AssetImage("assets/images/template_avatar.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                widget.toUser.username,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: MessageList(toUser: widget.toUser)),
          InputConteiner(
            toUser: widget.toUser,
          ),
        ],
      ),
    );
  }
}
