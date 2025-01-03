import 'package:flutter/material.dart';
import 'package:flutter_chat/provider/login_provider.dart';
import 'package:flutter_chat/services/login_auth_service.dart';
import 'package:provider/provider.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
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
            controller: passController,
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
            onPressed: () async {
              LoginAuthService.loginUser(
                  usernameController.text, passController.text, context);
            },
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
