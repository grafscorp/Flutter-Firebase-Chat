import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_chat/services/user_data_servide.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserChat {
  String username;
  String email;
  String? photoUrl;
  String? desc;
  String uid;
  List<dynamic?>? latestChats;
  UserChat({
    required this.username,
    required this.email,
    this.photoUrl,
    this.desc,
    required this.uid,
    this.latestChats,
  });

  UserChat copyWith({
    String? username,
    String? email,
    String? photoUrl,
    String? desc,
    String? uid,
    List<dynamic>? latestChats,
  }) {
    return UserChat(
      username: username ?? this.username,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      desc: desc ?? this.desc,
      uid: uid ?? this.uid,
      latestChats: latestChats ?? this.latestChats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'photoUrl': photoUrl,
      'desc': desc,
      'uid': uid,
      'latestChats': latestChats,
    };
  }

  factory UserChat.fromMap(Map<String, dynamic> map) {
    return UserChat(
      username: map['username'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      uid: map['uid'] as String,
      latestChats: map['latestChats'] != null
          ? List<String>.from((map['latestChats'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserChat.fromJson(String source) =>
      UserChat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserChat(username: $username, email: $email, photoUrl: $photoUrl, desc: $desc, uid: $uid, latestChats: $latestChats)';
  }

  @override
  bool operator ==(covariant UserChat other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.photoUrl == photoUrl &&
        other.desc == desc &&
        other.uid == uid &&
        listEquals(other.latestChats, latestChats);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        photoUrl.hashCode ^
        desc.hashCode ^
        uid.hashCode ^
        latestChats.hashCode;
  }

  static Future<UserChat> parseUserFirebase(User user) async {
    UserDataServide userData = UserDataServide();
    final _userDat = await userData.getUserData(user);

    return UserChat(
      username: _userDat["username"],
      email: _userDat["email"],
      uid: _userDat["uid"],
      photoUrl: _userDat["photoUrl"],
      desc: _userDat["about"],
      latestChats: _userDat["latestChats"] as List<dynamic>,
    );
  }

  static Future<UserChat> parseUserFirebaseEmail(String email) async {
    UserDataServide userData = UserDataServide();
    final _userDat = await userData.getUserDataFromUserEmail(email);

    return UserChat(
      username: _userDat["username"],
      email: _userDat["email"],
      uid: _userDat["uid"],
      photoUrl: _userDat["photoUrl"],
      desc: _userDat["about"],
      latestChats: _userDat["latestChats"] as List<dynamic>,
    );
  }
}
