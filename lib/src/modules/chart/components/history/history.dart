import 'package:flutter/material.dart';

import 'item_history.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Giá',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            Text(
              'Trạng thái',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            Text(
              'SL đầu',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            Text(
              'Thời gian',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
          ],
        ),
        Container(
          width: size.width,
          height: 1,
          color: Colors.white54,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: Colors.greenAccent,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: Colors.redAccent,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'đóng',
          time: '20.16',
          color: Colors.greenAccent,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: Colors.greenAccent,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: Colors.greenAccent,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'đóng',
          time: '20.16',
          color: Colors.redAccent,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: Colors.greenAccent,
        ),
      ]),
    ));
  }
}
