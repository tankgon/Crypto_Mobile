import 'package:flutter/material.dart';

class CastItem extends StatelessWidget {
  const CastItem({
    Key? key,
    required this.size,
    required this.e,
  }) : super(key: key);

  final Size size;
  final e;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 4),
          child: Container(
            width: size.width / 4.5,
            height: size.width / 4.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(e.img))),
          ),
        ),
        Text(
          e.name,
          style: const TextStyle(
            color: Colors.white30,
          ),
        )
      ],
    );
  }
}
