import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/provider/login_provider.dart';
import 'package:flutter_chat/services/login_auth_service.dart';
import 'package:provider/provider.dart';

class RegistrationContainer extends StatefulWidget {
  const RegistrationContainer({super.key});

  @override
  State<RegistrationContainer> createState() => _RegistrationContainerState();
}

class _RegistrationContainerState extends State<RegistrationContainer> {
  final maxPasswordLenght = 20;
  final minPasswordLenght = 6;

  final userTextController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final rePasswordFieldController = TextEditingController();
  bool isPasswordValid = true;
  bool isRePasswordValid = true;

  void createUser() async {}

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: userTextController,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //Password field
          TextField(
            controller: passwordFieldController,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.shield),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorText: !isPasswordValid
                    ? "Password should have from $minPasswordLenght to $maxPasswordLenght."
                    : null),
            onChanged: (inputPassText) {
              setState(() {
                isPasswordValid = !(inputPassText.length > maxPasswordLenght ||
                    inputPassText.length < minPasswordLenght);
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          //Repeat Password Field
          TextField(
              controller: rePasswordFieldController,
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.shield),
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorText:
                      !isRePasswordValid ? "Passwords arent same" : null),
              onChanged: (inputRePassText) {
                setState(() {
                  isRePasswordValid =
                      !(inputRePassText != passwordFieldController.text);
                });
              }),
          SizedBox(
            height: 30,
          ),

          //Buttons
          //Create Account Button
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(
              "Create an Account",
            ),
            onPressed: () async {
              if (isPasswordValid && isRePasswordValid) {
                //
                await LoginAuthService.createUser(userTextController.text,
                    passwordFieldController.text, context);
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text("Or"),
          SizedBox(
            height: 10,
          ),
          //Log Out Button
          ElevatedButton(
            onPressed: () {
              //
              loginProvider.changeLoginPage(isCreateAccount: false);
            },
            child: Text("Log In"),
          ),
        ],
      ),
    );
  }
}
