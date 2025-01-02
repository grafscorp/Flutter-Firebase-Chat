import 'package:flutter/material.dart';
import 'package:flutter_chat/components/login_container.dart';
import 'package:flutter_chat/components/registration_container.dart';
import 'package:flutter_chat/provider/LoginProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final spaceBetween = Size(0, 10);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(isCreateAccountPage: true),
      child: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) => Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Colors.yellowAccent,
                Colors.purple,
              ], center: Alignment.topLeft, radius: 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Image.asset("assets/images/logoMsgPurple.png")),
                    //Title
                    Text(
                      "Welcome to",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Flutter Chat!!!",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    loginProvider.isCreateAccountPage
                        ? RegistrationContainer()
                        : LoginContainer()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
