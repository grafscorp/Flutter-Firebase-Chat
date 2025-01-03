import 'package:flutter/material.dart';
import 'package:flutter_chat/provider/login_provider.dart';
import 'package:provider/provider.dart';

class RegistrationContainer extends StatefulWidget {
  const RegistrationContainer({super.key});

  @override
  State<RegistrationContainer> createState() => _RegistrationContainerState();
}

class _RegistrationContainerState extends State<RegistrationContainer> {
  final maxPasswordLenght = 20;
  final minPasswordLenght = 7;

  final passwordFieldController = TextEditingController();
  final rePasswordFieldController = TextEditingController();
  bool isPasswordValid = true;
  bool isRePasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
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
              if (inputPassText.length > maxPasswordLenght ||
                  inputPassText.length < minPasswordLenght) {
                setState(() {
                  isPasswordValid = false;
                });
              } else {
                setState(() {
                  isPasswordValid = true;
                });
              }
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
                hintText: "Repeat Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorText: !isRePasswordValid ? "Passwords arent same" : null),
            onChanged: (inputRePassText) {
              if (inputRePassText != passwordFieldController.text) {
                setState(() {
                  isRePasswordValid = false;
                });
              } else {
                setState(() {
                  isRePasswordValid = true;
                });
              }
            },
          ),
          SizedBox(
            height: 30,
          ),

          //Buttons
          //Create Account Button
          ElevatedButton(
            //style: ButtonStyle(backgroundColor: Colors.amberAccent),
            //style: Theme.of(context).buttonTheme.,
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {},
            child: Text(
              "Create an Account",
              //style: Theme.of(context).textTheme.bodyMedium,
            ),
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
              loginProvider.changeLoginPage(isCreateAccount: false);
            },
            child: Text("Log In"),
          ),
        ],
      ),
    );
  }
}
