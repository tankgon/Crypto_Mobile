// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import '../../config/api/user_repository.dart';

class InputToken extends StatefulWidget {
  InputToken({
    Key? key,
    required this.label,
    this.controller,
    required this.obscureText,
  }) : super(key: key);

  final String? label;
  final TextEditingController? controller;
  bool obscureText;

  @override
  State<InputToken> createState() => _InputTokenState();
}

class _InputTokenState extends State<InputToken> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.controller == null
                  ? '${UserRepository().dataToken}'
                  : null,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                  hintText: '',
                  hintStyle: AppTextStyles.h1,
                  labelText: widget.label,
                  labelStyle: AppTextStyles.h1CG,
                  focusedBorder: InputBorder.none),
            ),
          ),
          widget.label == "Password"
              ? SizedBox(
                  width: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(widget.obscureText
                              ? Icons.visibility 
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              widget.obscureText = !widget.obscureText;
                            });
                          }),
                    ),
                  ),
                )
              : const Text(''),
        ],
      ),
    );
  }
}
