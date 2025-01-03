import 'package:flutter/material.dart';

class UserListTileCircle extends StatelessWidget {
  UserListTileCircle({super.key, required this.userName, this.userAvatar});

  String userName;
  String? userAvatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Theme.of(context).highlightColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            CircleAvatar(
              radius: 50,
              foregroundImage: AssetImage("assets/images/template_avatar.png"),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              userName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
