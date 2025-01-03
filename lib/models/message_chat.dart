// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageChat {
  final String senderEmail;
  final String senderUsername;
  final String receiverEmail;
  final String msgData;
  final Timestamp timestamp;
  MessageChat({
    required this.senderEmail,
    required this.senderUsername,
    required this.receiverEmail,
    required this.msgData,
    required this.timestamp,
  });

  MessageChat copyWith({
    String? senderEmail,
    String? senderUsername,
    String? receiverEmail,
    String? msgData,
    Timestamp? timestamp,
  }) {
    return MessageChat(
      senderEmail: senderEmail ?? this.senderEmail,
      senderUsername: senderUsername ?? this.senderUsername,
      receiverEmail: receiverEmail ?? this.receiverEmail,
      msgData: msgData ?? this.msgData,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderEmail': senderEmail,
      'senderUsername': senderUsername,
      'receiverEmail': receiverEmail,
      'msgData': msgData,
      'timestamp': timestamp,
    };
  }

  factory MessageChat.fromMap(Map<String, dynamic> map) {
    return MessageChat(
      senderEmail: map['senderEmail'] as dynamic,
      senderUsername: map['senderUsername'] as dynamic,
      receiverEmail: map['receiverEmail'] as dynamic,
      msgData: map['msgData'] as dynamic,
      timestamp: map['timestamp'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageChat.fromJson(String source) =>
      MessageChat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageChat(senderEmail: $senderEmail, senderUsername: $senderUsername, receiverEmail: $receiverEmail, msgData: $msgData, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant MessageChat other) {
    if (identical(this, other)) return true;

    return other.senderEmail == senderEmail &&
        other.senderUsername == senderUsername &&
        other.receiverEmail == receiverEmail &&
        other.msgData == msgData &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return senderEmail.hashCode ^
        senderUsername.hashCode ^
        receiverEmail.hashCode ^
        msgData.hashCode ^
        timestamp.hashCode;
  }
}
