import 'package:flutter/material.dart';

import 'item_command.dart';

class Command extends StatelessWidget {
  const Command({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemCommand(
            size: size,
            color: const Color.fromARGB(160, 76, 175, 79),
          ),
          ItemCommand(
            size: size,
            color: const Color.fromARGB(160, 76, 175, 79),
          ),
          ItemCommand(
            size: size,
            color: const Color.fromARGB(160, 76, 175, 79),
          ),
          ItemCommand(
            size: size,
            color: const Color.fromARGB(160, 244, 67, 54),
          ),
          ItemCommand(
            size: size,
            color: const Color.fromARGB(160, 76, 175, 79),
          ),
        ],
      ),
    );
  }
}
