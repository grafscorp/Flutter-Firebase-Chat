import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/userPage/profile_appbar.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/pages/account_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserChat.parseUserFirebase(FirebaseAuth.instance.currentUser!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          FirebaseAuth.instance.signOut();
          return Text("Error");
        } else if (snapshot.hasData) {
          return AccountPage(user: snapshot.data!);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
