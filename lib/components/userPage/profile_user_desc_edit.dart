import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileUserDescEdit extends StatefulWidget {
  const ProfileUserDescEdit(
      {super.key, required this.userEmail, required this.userDesc});
  final String userEmail;
  final String userDesc;
  @override
  State<ProfileUserDescEdit> createState() => _ProfileUserDescEditState();
}

class _ProfileUserDescEditState extends State<ProfileUserDescEdit> {
  final textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textController.text = widget.userDesc;
  }

  var isActive = false;
  final onFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextField(
      //style: TextStyle(backgroundColor: Colors.deepPurple),
      textAlign: isActive ? TextAlign.start : TextAlign.center,
      controller: textController,
      focusNode: onFocus,
      maxLines: 50,
      decoration: InputDecoration(
        hintText: "Write something about yourself",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
      ),
      // onEditingComplete: () {
      //   print("OK");
      //   //setDescToUser(textController.text);
      // },
      onTapOutside: (e) {
        setDescToUser(textController.text);
        setState(() {
          onFocus.unfocus();
          isActive = false;
        });
      },
      onTap: () {
        setState(() {
          isActive = true;
        });
      },
      // onSubmitted: (value) {
      //   print("OK");
      // },
    );
  }

  void setDescToUser(String desc) async {
    final userDesc = {"about": desc};
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.userEmail)
        .update(userDesc);
  }
}
