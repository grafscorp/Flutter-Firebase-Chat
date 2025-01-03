import 'package:flutter/material.dart';
import 'package:flutter_chat/components/user_list_tile_circle.dart';
import 'package:flutter_chat/mock/firebase_users_mock.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: users_list.length,
                  itemBuilder: (context, index) {
                    return users_list[index];
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
