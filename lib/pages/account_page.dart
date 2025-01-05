import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/userPage/profile_appbar.dart';
import 'package:flutter_chat/components/userPage/profile_user_avatar.dart';
import 'package:flutter_chat/components/userPage/profile_user_desc.dart';
import 'package:flutter_chat/components/userPage/profile_username.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/pages/message_user_page.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key, required this.user});

  final UserChat user;

  @override
  Widget build(BuildContext context) {
    //print(user.email);
    bool isSelfAccount = user.uid == FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
        appBar: isSelfAccount
            ? getAppBarMyProfile(context)
            : getAppBarProfile(context),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileUserAvatar(
                    userId: user.uid,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //UserName
              ProfileUsername(
                userId: user.uid,
                username: user.username,
              ),
              SizedBox(
                height: 20,
              ),
              //Text Button
              !isSelfAccount
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MessageUserPage(toUser: user),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Send message",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    )
                  : Text(""),

              SizedBox(
                height: 30,
              ),
              Text(
                "About me:",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ProfileUserDesc(
                  userEmail: user.email,
                  userDesc: user.desc,
                ),
              ),
            ],
          ),
        ));
  }
}
