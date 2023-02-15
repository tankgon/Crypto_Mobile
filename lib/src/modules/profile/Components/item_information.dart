import 'package:flutter/material.dart';

class ItemInformation extends StatelessWidget {
  const ItemInformation({
    Key? key,
    required this.size,
    this.label,
    this.money,
  }) : super(key: key);

  final Size size;
  final String? label;
  final String? money;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      height: size.height / 14,
      decoration: BoxDecoration(
          color: const Color.fromARGB(16, 33, 149, 243),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white30)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                label!,
                style: const TextStyle(color: Colors.white54, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.white38,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  money!,
                  style: const TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
