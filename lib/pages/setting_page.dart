import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text("Log Out"))
        ],
      ),
    );
  }
}
