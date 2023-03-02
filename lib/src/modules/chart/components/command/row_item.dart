import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    Key? key,
    this.name,
    this.number,
  }) : super(key: key);
  final String? name;
  final String? number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name ?? '',
          style: AppTextStyles.h1,
        ),
        Text(
          number ?? '',
          style: AppTextStyles.h1,
        )
      ],
    );
  }
}
