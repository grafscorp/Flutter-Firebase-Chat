import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  MessageBox({super.key, required this.time});
  bool isMyMessage = false;
  String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(isMyMessage ? 20 : 0),
                  bottomRight: Radius.circular(isMyMessage ? 0 : 20),
                ),
                color: isMyMessage
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: isMyMessage
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      "aasdadasdadasdadasdadasdadasdadasdadasdadasdadasdadasdadasdadasdadasdadasdadsdad",
                      overflow: TextOverflow.visible,
                    ),
                    Text(time)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
