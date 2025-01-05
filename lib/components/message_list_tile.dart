import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/pages/message_user_page.dart';

class MessageListTile extends StatelessWidget {
  MessageListTile({super.key, required this.user, this.newMessages});

  final UserChat user;
  final int? newMessages;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(14),
      leading: CircleAvatar(
        radius: 30,
        foregroundImage: AssetImage("assets/images/template_avatar.png"),
      ),
      title: Text(user.username),
      trailing: newMessages != null
          ? CircleAvatar(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              radius: 15,
              child: Text(
                newMessages! < 100 ? "$newMessages" : "99+",
                //style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          : null,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessageUserPage(toUser: user),
            ));
      },
    );
  }
}
