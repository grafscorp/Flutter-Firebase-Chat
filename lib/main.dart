import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/home_page.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/pages/message_user_page.dart';
import 'package:flutter_chat/themes/flutter_midnight_neon_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FluttterMidnightNeonTheme.lightTheme,
      darkTheme: FluttterMidnightNeonTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MessageUserPage(),
    );
  }
}
