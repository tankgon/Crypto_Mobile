import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Color getColor(state) {
    switch (state) {
      case 'busy':
        return Colors.white30;
      case 'ide':
        return Colors.white10;
      case 'active':
        return Colors.white10;
      default:
        return Colors.amber;
    }
  }
}
