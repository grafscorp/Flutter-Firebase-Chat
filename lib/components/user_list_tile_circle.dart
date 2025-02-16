import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/pages/account_page.dart';

class UserListTileCircle extends StatelessWidget {
  UserListTileCircle({super.key, required this.user});

  final UserChat user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: InkWell(
        borderRadius: BorderRadius.circular(150),
        radius: 150,
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              CircleAvatar(
                radius: 50,
                foregroundImage:
                    AssetImage("assets/images/template_avatar.png"),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                user.username,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AccountPage(user: user);
              },
            ),
          );
        },
      ),
    );
  }
}
