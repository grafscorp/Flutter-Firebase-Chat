import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/models/message_chat.dart';
import 'package:flutter_chat/models/user_chat.dart';
import 'package:flutter_chat/services/user_data_servide.dart';

class ChatService {
  Future<void> initMessage(UserChat toUser) async {
    final userDataService = UserDataServide();
    var userData = await userDataService.getUserDataFromUserEmail(toUser.email);
    String chatRoomID = getChatRoomId(toUser.email);
    bool addToReceiverUser = true;
    for (var latestChat in userData['latestChats']) {
      if (latestChat == chatRoomID) {
        addToReceiverUser = false;
      }
    }
    if (addToReceiverUser) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(toUser.email)
          .update(
        {
          "latestChats": FieldValue.arrayUnion(
            [chatRoomID],
          )
        },
      );
      // FirebaseFirestore.instance.collection("chat_rooms").doc(chatRoomID).
    }
    userData = await userDataService
        .getUserDataFromUserEmail(FirebaseAuth.instance.currentUser!.email!);
    bool addToSelf = true;
    for (var latestChat in userData['latestChats']) {
      if (latestChat == chatRoomID) {
        addToSelf = false;
      }
    }
    if (addToSelf) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.email!)
          .update(
        {
          "latestChats": FieldValue.arrayUnion(
            [chatRoomID],
          )
        },
      );
    }
  }

  Future<void> sendMessage(String receiverEmail, String data) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    UserChat currentUserChat = await UserChat.parseUserFirebase(currentUser);
    final String currentUserName = currentUserChat.username;
    final Timestamp timestamp = Timestamp.now();

    MessageChat newMessage = MessageChat(
        //TODO
        senderEmail: receiverEmail,
        senderUsername: currentUserName,
        //TODO
        receiverEmail: receiverEmail,
        msgData: data,
        timestamp: timestamp);

    String chatRoomID = getChatRoomId(receiverEmail);

    await FirebaseFirestore.instance
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());

    List<String?> usersEmail = [
      await FirebaseAuth.instance.currentUser!.email,
      receiverEmail
    ];
    usersEmail.sort();
    await FirebaseFirestore.instance
        .collection("chat_rooms")
        .doc(chatRoomID)
        .set({
      "users": [usersEmail[0], usersEmail[1]]
    });
  }

  Stream<QuerySnapshot> getMessages(String toUserEmail, userEmail) {
    String chatRoomID = getChatRoomId(toUserEmail);

    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  String getChatRoomId(String toUserEmail) {
    List<String> emails = [
      toUserEmail,
      FirebaseAuth.instance.currentUser!.email!
    ];
    emails.sort();
    return emails.join('_');
  }

  static Future<List<dynamic>> getUserChat() async {
    UserChat myUser = await UserChat.parseUserFirebase(
        await FirebaseAuth.instance.currentUser!);
    if (myUser.latestChats == null || myUser.latestChats!.isEmpty) return [];
    List<dynamic> lastChats = [];

    for (var userLastRoom in myUser.latestChats!) {
      final chatRoomsData = await FirebaseFirestore.instance
          .collection('chat_rooms')
          .doc(userLastRoom)
          .get();

      for (var userMail in chatRoomsData['users']) {
        if (userMail == await FirebaseAuth.instance.currentUser!.email)
          continue;
        lastChats.add(userMail);
      }
    }
    return lastChats;
  }
}
