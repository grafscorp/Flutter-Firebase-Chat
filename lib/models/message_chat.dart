// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageChat {
  final String senderID;
  final String senderUsername;
  final String receiverID;
  final String msgData;
  final Timestamp timestamp;
  MessageChat({
    required this.senderID,
    required this.senderUsername,
    required this.receiverID,
    required this.msgData,
    required this.timestamp,
  });

  MessageChat copyWith({
    String? senderID,
    String? senderUsername,
    String? receiverID,
    String? msgData,
    Timestamp? timestamp,
  }) {
    return MessageChat(
      senderID: senderID ?? this.senderID,
      senderUsername: senderUsername ?? this.senderUsername,
      receiverID: receiverID ?? this.receiverID,
      msgData: msgData ?? this.msgData,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderID': senderID,
      'senderUsername': senderUsername,
      'receiverID': receiverID,
      'msgData': msgData,
      'timestamp': timestamp,
    };
  }

  factory MessageChat.fromMap(Map<String, dynamic> map) {
    return MessageChat(
      senderID: map['senderID'] as String,
      senderUsername: map['senderUsername'] as String,
      receiverID: map['receiverID'] as String,
      msgData: map['msgData'] as String,
      timestamp: map['timestamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageChat.fromJson(String source) =>
      MessageChat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageChat(senderID: $senderID, senderUsername: $senderUsername, receiverID: $receiverID, msgData: $msgData, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant MessageChat other) {
    if (identical(this, other)) return true;

    return other.senderID == senderID &&
        other.senderUsername == senderUsername &&
        other.receiverID == receiverID &&
        other.msgData == msgData &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return senderID.hashCode ^
        senderUsername.hashCode ^
        receiverID.hashCode ^
        msgData.hashCode ^
        timestamp.hashCode;
  }
}
