import 'package:flutter/material.dart';

class BuidingTitleSelectPage extends StatelessWidget {
  const BuidingTitleSelectPage({
    Key? key,
    required this.content,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Text(
        content,
        style: const TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400),
      ),
    );
  }
}
