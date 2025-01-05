import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/models/message_chat.dart';

class MessageBox extends StatelessWidget {
  MessageBox({super.key, required this.msgData});
  final MessageChat msgData;
  @override
  Widget build(BuildContext context) {
    bool isMyMessage =
        msgData.senderEmail != FirebaseAuth.instance.currentUser!.email;
    return Row(
      mainAxisAlignment:
          isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(isMyMessage ? 20 : 0),
                  bottomRight: Radius.circular(isMyMessage ? 0 : 20),
                ),
                color: isMyMessage
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: isMyMessage
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      msgData.msgData,
                      overflow: TextOverflow.visible,
                    ),
                    Text(getTimeMessage(msgData.timestamp))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getTimeMessage(Timestamp time) {
    return formatDate(time.toDate(), [HH, ':', nn]);
  }
}
