import 'package:flutter/material.dart';

class OrderBookBuy extends StatelessWidget {
  const OrderBookBuy({Key? key, this.amount, this.mass, this.color})
      : super(key: key);

  final String? amount;
  final String? mass;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mass!,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            amount!,
            style: TextStyle(color: color, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
