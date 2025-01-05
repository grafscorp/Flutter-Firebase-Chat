import 'package:flutter/material.dart';

AppBar getAppBarMyProfile(BuildContext context) {
  return AppBar(
    title: Text("My Profile"),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/profile/settings');
        },
        icon: Icon(Icons.settings),
      )
    ],
  );
}

AppBar getAppBarProfile(BuildContext context) {
  return AppBar(
    title: Text("User"),
  );
}
