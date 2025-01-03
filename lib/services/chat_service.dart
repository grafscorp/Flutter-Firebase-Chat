import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/models/message_chat.dart';
import 'package:flutter_chat/models/user_chat.dart';

class ChatService {
  Future<void> sendMessage(String receiverID, String data) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    UserChat currentUserChat = await UserChat.parseUserFirebase(currentUser);
    final String currentUserID = currentUserChat.uid;
    final String currentUserName = currentUserChat.username;
    final Timestamp timestamp = Timestamp.now();

    MessageChat newMessage = MessageChat(
        senderID: currentUserID,
        senderUsername: currentUserName,
        receiverID: receiverID,
        msgData: data,
        timestamp: timestamp);
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await FirebaseFirestore.instance
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, user1Id) {
    List<String> ids = [userId, user1Id];
    ids.sort();
    String chatRoomID = ids.join('_');

    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots();
  }
}
