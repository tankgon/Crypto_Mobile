// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ValueStock extends StatelessWidget {
  const ValueStock({Key? key, required this.name, required this.color})
      : super(key: key);
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(name,
          style: TextStyle(
            color: color,
            fontSize: 14,
          )),
    );
  }
}
