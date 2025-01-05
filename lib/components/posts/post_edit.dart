import 'package:flutter/material.dart';
import 'package:flutter_chat/services/posts_database.dart';

class PostEdit extends StatefulWidget {
  const PostEdit({super.key});

  @override
  State<PostEdit> createState() => _PostEditState();
}

class _PostEditState extends State<PostEdit> {
  TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          top: 40,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Theme.of(context).colorScheme.onError),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    final postText = postController.text;
                    setState(() {
                      postController.clear();
                    });
                    if (postText.isEmpty) return;
                    PostsDatabase postsDatabase = PostsDatabase();
                    await postsDatabase.addPost(postText);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.send,
                    size: 60,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TextField(
                controller: postController,
                maxLines: 50,
                decoration: InputDecoration(
                    hintText: "Text post...", border: OutlineInputBorder()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
