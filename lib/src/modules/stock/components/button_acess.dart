import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

class ButtonAcess extends StatelessWidget {
  final String? name;
  final Color? color;

  const ButtonAcess({
    Key? key,
    this.name,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name ?? '',
                  style: AppTextStyles.h2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
