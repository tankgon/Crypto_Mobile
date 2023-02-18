import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height / 3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/18.png'), fit: BoxFit.cover),
              gradient: LinearGradient(
                  colors: [AppColors.none, Color(0xff131e30)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Container(
          height: 200,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff131e30), AppColors.none],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        )
      ],
    );
  }
}
