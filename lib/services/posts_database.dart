import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/services/user_data_servide.dart';

class PostsDatabase {
  final CollectionReference posts =
      FirebaseFirestore.instance.collection("Posts");
  final User? user = FirebaseAuth.instance.currentUser;

  Future<DocumentReference<Object?>> addPost(String postData) async {
    final UserDataServide userData = UserDataServide();
    final userName =
        await userData.getUserData(FirebaseAuth.instance.currentUser!);

    return posts.add({
      "username": userName["username"] != null ? userName["username"] : "Error",
      "postData": postData,
      "TimeStamp": Timestamp.now()
    });
  }

  Stream<QuerySnapshot> getPostsStream() {
    final postsStream = FirebaseFirestore.instance
        .collection("Posts")
        .orderBy("TimeStamp", descending: true)
        .snapshots();
    return postsStream;
  }
}
