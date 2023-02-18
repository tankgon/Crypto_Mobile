import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';

class InputToken extends StatelessWidget {
  const InputToken({
    Key? key,
    this.label,
  }) : super(key: key);

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: '',
            hintStyle: AppTextStyles.h1,
            labelText: label,
            labelStyle: AppTextStyles.h1CG,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
