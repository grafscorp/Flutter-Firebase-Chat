import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/info_dialogs.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/pages/account_page.dart';
import 'package:flutter_chat/pages/messages_page.dart';
import 'package:flutter_chat/pages/my_account_page.dart';
import 'package:flutter_chat/pages/posts_page.dart';
import 'package:flutter_chat/pages/users_page.dart';
import 'package:flutter_chat/services/user_data_servide.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    currentSection = initSection;
  }

  // ignore: constant_identifier_names
  static const SECTIONS = <String, IconData>{
    "Posts": Icons.home_rounded,
    "Messages": Icons.message_rounded,
    "Users": Icons.group_rounded,
    "Account": Icons.person_rounded,
  };
  final TabStyle _tabStyle = TabStyle.reactCircle;
  final sizeSections = 4;
  final initSection = 0;
  int currentSection = 1;
  List<Widget> sectionPages = [
    PostsPage(),
    MessagesPage(),
    UsersPage(),
    MyAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tryGetCurrentUserFromDB(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          showErrorDialog(context, "Error", "Сouldn't upload user");
          FirebaseAuth.instance.signOut();
        } else if (snapshot.hasData)
          return DefaultTabController(
            length: sizeSections,
            initialIndex: initSection,
            child: Scaffold(
              body: sectionPages[currentSection],
              //Nabigator Bar
              bottomNavigationBar: ConvexAppBar.badge(
                <int, dynamic>{1: ""},
                backgroundColor: Theme.of(context).colorScheme.background,
                style: _tabStyle,
                items: <TabItem>[
                  for (final section in SECTIONS.entries)
                    TabItem(icon: section.value, title: section.key),
                ],
                onTap: (index) {
                  setState(
                    () {
                      currentSection = index;
                    },
                  );
                },
              ),
            ),
          );
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<UserChat> tryGetCurrentUserFromDB() async {
    return await UserChat.parseUserFirebase(
        await FirebaseAuth.instance.currentUser!);
  }
}
