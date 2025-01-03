import 'package:flutter/material.dart';

class InputConteiner extends StatefulWidget {
  const InputConteiner({super.key});

  @override
  State<InputConteiner> createState() => _InputConteinerState();
}

class _InputConteinerState extends State<InputConteiner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25, top: 10, left: 10, right: 10),
      color: Colors.black87,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Message...",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
