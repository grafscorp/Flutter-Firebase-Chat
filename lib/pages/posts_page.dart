import 'package:flutter/material.dart';
import 'package:flutter_chat/mock/firebase_posts_mock.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                return postsList[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
