import 'package:flutter/material.dart';

class LeaderboardText extends StatelessWidget {
  final String text;

  LeaderboardText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
