import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingChatIndicator extends StatelessWidget {
  const LoadingChatIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        colors: [
          Colors.pinkAccent,
          Colors.pink,
          Colors.purpleAccent,
          Colors.purple,
          Colors.deepPurpleAccent,
          Colors.deepPurple
        ],
      ),
    );
  }
}
