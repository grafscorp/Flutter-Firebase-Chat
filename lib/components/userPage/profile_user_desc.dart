import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileUserDesc extends StatefulWidget {
  ProfileUserDesc({super.key, required this.userId, this.userDesc});
  String userId;
  String? userDesc;
  TextStyle decStyle = TextStyle(fontSize: 20);
  @override
  State<ProfileUserDesc> createState() => _ProfileUserDescState();
}

class _ProfileUserDescState extends State<ProfileUserDesc> {
  @override
  Widget build(BuildContext context) {
    if (widget.userDesc == null) return Text("");

    return widget.userId == FirebaseAuth.instance.currentUser!.uid
        ? Text(widget.userDesc!)
        : Text(widget.userDesc!);
  }
}
