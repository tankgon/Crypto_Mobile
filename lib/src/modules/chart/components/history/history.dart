import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';

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
              style: AppTextStyles.h1C,
            ),
            Text(
              'Trạng thái',
              style: AppTextStyles.h1C,
            ),
            Text(
              'SL đầu',
              style: AppTextStyles.h1C,
            ),
            Text(
              'Thời gian',
              style: AppTextStyles.h1C,
            ),
          ],
        ),
        Container(
          width: size.width,
          height: 1,
          color: AppColors.white54,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: AppColors.green,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: AppColors.red,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'đóng',
          time: '20.16',
          color: AppColors.green,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: AppColors.green,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: AppColors.green,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'đóng',
          time: '20.16',
          color: AppColors.red,
        ),
        const ItemHistory(
          amount: '20',
          price: '50',
          state: 'mở',
          time: '20.16',
          color: AppColors.green,
        ),
      ]),
    ));
  }
}
