import 'package:flutter/material.dart';

class PostListTile extends StatelessWidget {
  PostListTile({super.key, required this.userName, required this.data});

  String? userNameAvatar;
  String userName;
  String data;

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
                      userName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(DateTime.now().toString()),
                  ],
                ),
              )
            ],
          ),
          Divider(),
          Text(data),
        ],
      ),
    );
  }
}
