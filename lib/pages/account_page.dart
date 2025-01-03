import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key, required this.id});

  String id;

  bool isSelfAccount = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 100,
            foregroundImage: AssetImage("assets/images/template_avatar.png"),
          ),
          SizedBox(
            height: 10,
          ),
          //UserName
          Text(
            getUserName(id),
            style: TextStyle(fontSize: 40),
          ),

          SizedBox(
            height: 20,
          ),
          //Text Button
          !isSelfAccount
              ? ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Send message",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                )
              : Text(""),

          SizedBox(
            height: 30,
          ),
          Text(
            "About me:",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                getDescription(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getUserName(String id) {
    return "Hecker";
  }

  String getDescription() {
    return "Хекер проснулся утром, еще до того как зазвенел будильник. Он чувствовал прилив энергии и желание сразу же начать работать над своим проектом. Сегодня у него было много задач, которые нужно было выполнить, и он был готов взяться за дело. Он выпил чашку кофе, сел за свой компьютер и погрузился в мир кода, пытаясь решить задачу за задачей.\nХекер проснулся утром, еще до того как зазвенел будильник. Он чувствовал прилив энергии и желание сразу же начать работать над своим проектом. Сегодня у него было много задач, которые нужно было выполнить, и он был готов взяться за дело. Он выпил чашку кофе, сел за свой компьютер и погрузился в мир кода, пытаясь решить задачу за задачей.";
  }
}
