import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class PostListTile extends StatelessWidget {
  PostListTile(
      {super.key, required this.userName, required this.data, this.time});

  String? userNameAvatar;
  String? userName;
  String data;
  Timestamp? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              //Avatar
              CircleAvatar(
                foregroundImage:
                    AssetImage("assets/images/template_avatar.png"),
              ),
              SizedBox(
                width: 15,
              ),
              //UserName and TimePost
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userName != null ? userName! : "Error",
                      //userName,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    time != null ? Text(getTime(time!)) : SizedBox()
                  ],
                ),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(data),
            ],
          ),
        ],
      ),
    );
  }

  String getTime(Timestamp _time) {
    DateTime newTime = _time.toDate();
    String stringTime = formatDate(newTime, [dd, '-', mm, '-', yyyy]);
    return stringTime;
  }
}
