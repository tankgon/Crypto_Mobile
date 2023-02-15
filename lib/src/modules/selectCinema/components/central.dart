import 'package:flutter/material.dart';

class Central extends StatelessWidget {
  const Central({Key? key, required this.size, required this.time})
      : super(key: key);

  final Size size;
  // ignore: prefer_typing_uninitialized_variables
  final time;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 16),
        height: size.height / 15,
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(left: 24),
            width: size.width / 4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _getColor(time[index].state),
                borderRadius: BorderRadius.circular(14)),
            child: Text(
              time[index].times,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          itemCount: time.length,
          scrollDirection: Axis.horizontal,
        ));
  }

  Color _getColor(state) {
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
