import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileUsername extends StatefulWidget {
  ProfileUsername({super.key, required this.userId, required this.username});
  String userId;
  String? username;
  @override
  State<ProfileUsername> createState() => _ProfileUsernameState();
}

class _ProfileUsernameState extends State<ProfileUsername> {
  final TextStyle usernameTextStyle = TextStyle(fontSize: 40);
  late String username;
  @override
  void initState() {
    super.initState();
    username = widget.username != null ? widget.username! : "Error";
  }

  @override
  Widget build(BuildContext context) {
    return widget.userId == FirebaseAuth.instance.currentUser!.uid
        ? Text(username, style: usernameTextStyle)
        : Text(username, style: usernameTextStyle);
  }
}
