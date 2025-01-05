import 'package:flutter/material.dart';

class ProfileUserAvatar extends StatelessWidget {
  ProfileUserAvatar({super.key, required this.userId, this.photoUrl});

  final String userId;
  final String? photoUrl;

  final raduisAcatar = 100.0;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: raduisAcatar,
      foregroundImage: AssetImage("assets/images/template_avatar.png"),
    );
  }
}
