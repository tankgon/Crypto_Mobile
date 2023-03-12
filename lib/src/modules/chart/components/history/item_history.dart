import 'package:flutter/material.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory({
    Key? key,
    this.price,
    this.state,
    this.amount,
    this.time,
    this.color,
    required this.size,
  }) : super(key: key);
  final String? price;
  final String? state;
  final String? amount;
  final String? time;
  final Color? color;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 2.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price ?? '',
                  style: TextStyle(color: color, fontSize: 16),
                ),
                Text(
                  state ?? '',
                  style: TextStyle(color: color, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width / 2.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  amount ?? '',
                  style: TextStyle(color: color, fontSize: 16),
                ),
                Text(
                  time ?? '',
                  style: TextStyle(color: color, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
