import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(this.icon, this.size, this.gradient, {super.key});

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: AppColors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}