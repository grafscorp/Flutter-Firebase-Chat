import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/setting_page.dart';

AppBar getAppBarMyProfile(BuildContext context) {
  return AppBar(
    title: Text("My Profile"),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SettingPage();
                },
              ),
            );
          },
          icon: Icon(Icons.settings))
    ],
  );
}

AppBar getAppBarProfile(BuildContext context) {
  return AppBar(
    title: Text("User"),
  );
}
