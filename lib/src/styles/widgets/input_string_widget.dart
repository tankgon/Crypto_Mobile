import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

import '../../config/api/user_repository.dart';

class InputToken extends StatelessWidget {
  const InputToken({
    Key? key,
    required this.label,
    this.controller, required this.obscureText,
  }) : super(key: key);

  final String? label;
  final TextEditingController? controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey)),
      child: TextFormField(
        controller: controller,
        initialValue:
            controller == null ? '${UserRepository().dataToken}' : null,
        obscureText: obscureText ?? false,
        
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
