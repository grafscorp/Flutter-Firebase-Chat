import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/userPage/profile_user_desc_edit.dart';

class ProfileUserDesc extends StatefulWidget {
  ProfileUserDesc({super.key, required this.userEmail, this.userDesc});
  final String userEmail;
  final String? userDesc;
  final TextStyle decStyle = TextStyle(fontSize: 20);
  @override
  State<ProfileUserDesc> createState() => _ProfileUserDescState();
}

class _ProfileUserDescState extends State<ProfileUserDesc> {
  @override
  Widget build(BuildContext context) {
    if (widget.userDesc == null) return Text("");

    return widget.userEmail == FirebaseAuth.instance.currentUser!.email
        ? ProfileUserDescEdit(
            userEmail: widget.userEmail, userDesc: widget.userDesc!)
        : Text(widget.userDesc!);
  }
}
