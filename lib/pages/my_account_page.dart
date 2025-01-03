import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/account_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: AccountPage(id: ""),
    );
  }
}
