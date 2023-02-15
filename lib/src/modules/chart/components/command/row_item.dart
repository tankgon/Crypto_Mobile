import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    Key? key,
    this.name,
    this.number,
  }) : super(key: key);
  final String? name;
  final String? number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name!,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          number!,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
