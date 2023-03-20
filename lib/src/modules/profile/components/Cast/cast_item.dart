import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_flutter/src/models/platform.dart';

class CastItem extends StatelessWidget {
  const CastItem({
    Key? key,
    required this.size,
    required this.e,
  }) : super(key: key);

  final Size size;
  final IProfile e;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 4),
          child: Container(
            width: size.width / 4.5,
            height: size.width / 4.5,
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(98, 245, 246, 249),
                shape: BoxShape.circle),
            child: SvgPicture.asset(e.name),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(14),
            //     image: const DecorationImage(
            //         fit: BoxFit.cover, image: AssetImage('images/3.png'))),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 4),
          child: Text(
            e.img,
            style: const TextStyle(
              color: Colors.white30,
            ),
          ),
        )
      ],
    );
  }
}
