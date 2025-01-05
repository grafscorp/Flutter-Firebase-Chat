import 'package:flutter/material.dart';
import 'package:flutter_chat/components/loading_chat_indicator.dart';
import 'package:flutter_chat/components/post_list_tile.dart';
import 'package:flutter_chat/components/posts/post_edit.dart';
import 'package:flutter_chat/services/posts_database.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final postDataBase = PostsDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: postDataBase.getPostsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingChatIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else if (snapshot.hasData) {
                  final postList = snapshot.data!.docs;
                  if (snapshot.data == null || postList.isEmpty)
                    return Text("No posts");
                  else {
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return PostListTile(
                          userName: postList[index]['username'],
                          data: postList[index]['postData'],
                          time: postList[index]['TimeStamp'],
                        );
                      },
                    );
                  }
                }
                return Center(
                  child: LoadingChatIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) {
              return PostEdit();
            },
          );
        },
        icon: Icon(
          Icons.add_circle_sharp,
          size: 100,
        ),
      ),
    );
  }
}
