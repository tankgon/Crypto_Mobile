import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

class ItemInformation extends StatelessWidget {
  const ItemInformation({
    Key? key,
    required this.size,
    this.label,
    this.money,
  }) : super(key: key);

  final Size size;
  final String? label;
  final String? money;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      height: size.height / 16,
      decoration: BoxDecoration(
          color: const Color.fromARGB(16, 33, 149, 243),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.white54)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                label ?? '',
                style: AppTextStyles.h1C,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: AppColors.white54,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  money ?? '',
                  style: AppTextStyles.h1,
                )),
          )
        ],
      ),
    );
  }
}
