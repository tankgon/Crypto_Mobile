import 'package:flutter/material.dart';

import '../../../../widgets/gradien_text.dart';
import '../../../stock/components/button_acess.dart';
import '../../../stock/components/value_stock.dart';

class HeaderChart extends StatelessWidget {
  const HeaderChart({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: size.height / 30,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          GradientText(
            '9.2632 ETH',
            style: const TextStyle(fontSize: 40),
            gradient: LinearGradient(colors: [
              Colors.blue.shade400,
              Colors.blue.shade100,
            ]),
          ),
          Container(
            width: size.width / 1.8,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ValueStock(
                  name: '12.45',
                  color: Colors.yellowAccent,
                ),
                ValueStock(
                  name: '20.34',
                  color: Colors.blueAccent,
                ),
                ValueStock(
                  name: '17.93',
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width / 1.15,
            child: Row(
              children: const [
                ButtonAcess(
                  name: "Mua",
                  color: Colors.green,
                ),
                ButtonAcess(
                  name: "Bán",
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
