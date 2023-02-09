import 'package:flutter/material.dart';

class BuidingTitle extends StatelessWidget {
  const BuidingTitle({
    Key? key,
    required this.content,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Text(
        content,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
