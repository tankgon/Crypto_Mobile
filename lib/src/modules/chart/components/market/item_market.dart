import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

class ItemMarket extends StatelessWidget {
  const ItemMarket({
    Key? key,
    this.price,
    this.state,
    this.amount,
    this.time,
    this.color,
  }) : super(key: key);
  final String? price;
  final String? state;
  final String? amount;
  final String? time;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            price!,
            style: TextStyle(color: color, fontSize: 16),
          ),
          Text(
            amount!,
            style: AppTextStyles.h1,
          ),
          Text(
            time!,
            style: AppTextStyles.h1,
          ),
        ],
      ),
    );
  }
}
