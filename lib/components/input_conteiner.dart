import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/services/chat_service.dart';

class InputConteiner extends StatefulWidget {
  InputConteiner({super.key, required this.toUser});
  UserChat toUser;
  @override
  State<InputConteiner> createState() => _InputConteinerState();
}

class _InputConteinerState extends State<InputConteiner> {
  final _chatService = ChatService();
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25, top: 10, left: 10, right: 10),
      color: Colors.black87,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: "Message...",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      await _chatService.sendMessage(
                          widget.toUser.email, _textController.text);
                      setState(() {
                        _textController.clear();
                      });
                    },
                    icon: Icon(Icons.send),
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }
}
