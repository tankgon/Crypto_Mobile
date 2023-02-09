import 'package:flutter/material.dart';

import '../../../models/days.dart';

class ChooseDate extends StatelessWidget {
  const ChooseDate({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map((e) => Builder(
                builder: (context) => Container(
                      height: size.height / 8,
                      width: size.width / 5,
                      decoration: BoxDecoration(
                          color: _getColor(e.state),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(e.dayS,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text((20 + days.indexOf(e)).toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          ]),
                    )))
            .toList(),
      ),
    );
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
