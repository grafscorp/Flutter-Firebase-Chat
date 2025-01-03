import 'package:flutter/material.dart';

class MessageListTile extends StatelessWidget {
  MessageListTile(
      {super.key, required this.userName, this.newMessages, this.userAvatar});
  String? userAvatar;
  String userName;
  int? newMessages;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(14),
      leading: CircleAvatar(
        radius: 30,
        foregroundImage: AssetImage("assets/images/template_avatar.png"),
      ),
      title: Text(userName),
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
      onTap: () {},
    );
  }
}
