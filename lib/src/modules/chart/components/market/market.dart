import 'package:flutter/material.dart';

import '../../../../styles/themes/app_colors.dart';
import 'item_market.dart';

class Market extends StatelessWidget {
  const Market({
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
              style: TextStyle(color: AppColors.white54, fontSize: 16),
            ),
            Text(
              'Số Lượng',
              style: TextStyle(color: AppColors.white54, fontSize: 16),
            ),
            Text(
              'Thời gian',
              style: TextStyle(color: AppColors.white54, fontSize: 16),
            ),
          ],
        ),
        Container(
          width: size.width,
          height: 1,
          color: AppColors.white54,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        const ItemMarket(
          price: '23',
          amount: '10',
          time: '12:54',
          color: AppColors.green,
        ),
        const ItemMarket(
          price: '223',
          amount: '140',
          time: '12:54',
          color: AppColors.green,
        ),
        const ItemMarket(
          price: '223',
          amount: '10',
          time: '12:54',
          color: AppColors.red,
        ),
        const ItemMarket(
          price: '213',
          amount: '10',
          time: '12:54',
          color: AppColors.green,
        ),
      ]),
    ));
  }
}
