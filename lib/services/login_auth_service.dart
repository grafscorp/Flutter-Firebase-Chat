import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/components/info_dialogs.dart';



class LoginAuthService {
  static const String userMail = "@flutterchat.com";

  static Future<void> createUser(
      String username, String pass, BuildContext context) async {
    username += userMail;

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: username, password: pass);

      _createUserDocument(userCredential);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorDialog(context, "Failed to create a user",
          "Verify that the username is correct.\n$e");
    }
  }

  static Future<void> loginUser(
      String username, String pass, BuildContext context) async {
    username += userMail;
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: pass);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      showErrorDialog(context, "The login attempt failed",
          "Verify that your password or username is correct\n$e");
    }
  }

  static Future<void> _createUserDocument(UserCredential? userCred) async {
    if (userCred == null || userCred.user == null) return;

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(userCred.user!.email)
        .set({
      "email": userCred.user!.email,
      "username": userCred.user!.email!.replaceAll(userMail, ""),
      "photoUrl": "",
      "about": "",
      "uid": userCred.user!.uid,
      "userPosts": "",
      "latestChats": []
    });
  }
}
