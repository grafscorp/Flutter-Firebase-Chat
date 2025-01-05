import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/info_dialogs.dart';
import 'package:flutter_chat/components/loading_chat_indicator.dart';
import 'package:flutter_chat/components/user_list_tile_circle.dart';
import 'package:flutter_chat/models/user_chat.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  static const maxRowUserList = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          //TODO Change stream builder to Futurebuilder with UserChat parser
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                showErrorDialog(
                    context, "Ошибка", "Не удалось загрузить пользователей");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingChatIndicator();
              } else if (snapshot.hasData) {
                final users = snapshot.data!.docs;
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return UserListTileCircle(
                            // userId: users[index]['uid'],
                            // userName: users[index]['username'],
                            // userMail: users[index]['email'],
                            user: UserChat(
                              username: users[index]['username'],
                              email: users[index]['email'],
                              uid: users[index]['uid'],
                              photoUrl: users[index]['photoUrl'],
                              desc: users[index]['about'],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return LoadingChatIndicator();
            },
          ),
        ));
  }
}
