import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/firebase_options.dart';
import 'package:flutter_chat/pages/auth_page.dart';
import 'package:flutter_chat/pages/home_page.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/pages/message_user_page.dart';
import 'package:flutter_chat/themes/flutter_midnight_neon_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: AuthPage(),
    );
  }
}
