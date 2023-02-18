import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';

class BuidingTitleSelectPage extends StatelessWidget {
  const BuidingTitleSelectPage({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Text(
        content ?? '',
        style: AppTextStyles.h2W,
      ),
    );
  }
}
