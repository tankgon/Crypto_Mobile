import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.name,
  }) : super(key: key);
  final String? name;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      margin: const EdgeInsets.only(top: 50),
      decoration: const ShapeDecoration(
          shape: StadiumBorder(), gradient: AppColors.gradienIcon),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Text(
          name ?? '',
          style: AppTextStyles.h2W,
        ),
        onPressed: () {},
      ),
    );
  }
}
