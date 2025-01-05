import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataServide {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(User user) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.email)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataFromUserEmail(
      String userEmail) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(userEmail)
        .get();
  }
}
