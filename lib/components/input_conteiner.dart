import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/services/chat_service.dart';

class InputConteiner extends StatefulWidget {
  InputConteiner({super.key, required this.toUser});
  final UserChat toUser;
  @override
  State<InputConteiner> createState() => _InputConteinerState();
}

class _InputConteinerState extends State<InputConteiner> {
  final _chatService = ChatService();
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 45, top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: "Message...",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      var msgText = _textController.text;
                      setState(() {
                        _textController.clear();
                      });
                      await _chatService.sendMessage(
                          widget.toUser.email, msgText);
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
