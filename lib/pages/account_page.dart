import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/userPage/profile_appbar.dart';
import 'package:flutter_chat/components/userPage/profile_user_avatar.dart';
import 'package:flutter_chat/components/userPage/profile_user_desc.dart';
import 'package:flutter_chat/components/userPage/profile_username.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/pages/message_user_page.dart';
import 'package:flutter_chat/services/user_data_servide.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key, required this.user});

  UserChat user;

  bool isSelfAccount = false;

  @override
  Widget build(BuildContext context) {
    //print(user.email);
    isSelfAccount = user.uid == FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
        appBar: isSelfAccount
            ? getAppBarMyProfile(context)
            : getAppBarProfile(context),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileUserAvatar(
                    userId: user.uid,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //UserName
              ProfileUsername(
                userId: user.uid,
                username: user.username,
              ),
              SizedBox(
                height: 20,
              ),
              //Text Button
              !isSelfAccount
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MessageUserPage(toUser: user),
                            ));
                      },
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
                  child: ProfileUserDesc(
                    userId: user.uid,
                    userDesc: user.desc,
                  ),
                ),
              ),
            ],
          ),
        )
        // child: FutureBuilder(
        //   future: userDataServide.getUserData(user),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       //TODO
        //       return CircularProgressIndicator();
        //     } else if (snapshot.hasError) {
        //       //TODO
        //       return Text("Eror");
        //     } else if (snapshot.hasData) {
        //       Map<String, dynamic>? userData = snapshot.data!.data();
        //       if (userData?["uid"] == null) {
        //         return Text("error");
        //       }
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               ProfileUserAvatar(
        //                 userId: user.uid,
        //               ),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 10,
        //           ),
        //           //UserName
        //           ProfileUsername(
        //             userId: userData!["uid"],
        //             username: userData["username"],
        //           ),
        //           SizedBox(
        //             height: 20,
        //           ),
        //           //Text Button
        //           !isSelfAccount
        //               ? ElevatedButton(
        //                   onPressed: () {},
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Text(
        //                       "Send message",
        //                       style: TextStyle(fontSize: 30),
        //                     ),
        //                   ),
        //                 )
        //               : Text(""),

        //           SizedBox(
        //             height: 30,
        //           ),
        //           Text(
        //             "About me:",
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           Expanded(
        //             child: SingleChildScrollView(
        //               child: ProfileUserDesc(
        //                 userId: userData["uid"],
        //                 userDesc: userData["about"],
        //               ),
        //             ),
        //           ),
        //         ],
        //       );
        //     } else {
        //       return CircularProgressIndicator();
        //     }
        //   },
        // ),
        );
  }
}
