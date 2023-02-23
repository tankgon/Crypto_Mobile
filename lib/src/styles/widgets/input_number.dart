import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

class TextNumber extends StatelessWidget {
  const TextNumber({
    Key? key,
    this.lable,
    this.suffix,
  }) : super(key: key);
  final String? lable;
  final String? suffix;
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey)),
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            hintText: '',
            hintStyle: AppTextStyles.h1,
            labelText: lable,
            labelStyle: AppTextStyles.h1CG,
            suffix: Text(suffix!),
            helperMaxLines: 1,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
