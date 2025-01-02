import 'package:flutter/material.dart';
import 'package:flutter_chat/provider/LoginProvider.dart';
import 'package:provider/provider.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
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
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.shield),
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
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
              "Log In",
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
              loginProvider.changeLoginPage(isCreateAccount: true);
            },
            child: Text("Create an Account"),
          ),
        ],
      ),
    );
  }
}
