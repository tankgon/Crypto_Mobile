import 'package:flutter/material.dart';
import 'package:movie_flutter/src/modules/stock/components/value_stock.dart';

class StockItem extends StatelessWidget {
  const StockItem({
    Key? key,
    required this.size,
    required this.name,
    required this.san,
    required this.sann,
    required this.tran,
    required this.thamchieu,
    required this.khoiluong,
  }) : super(key: key);

  final Size size;
  final name;
  final san;
  final sann;
  final tran;
  final thamchieu;
  final khoiluong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 2,
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      ValueStock(
                        name: sann,
                        color: Colors.yellow,
                      ),
                      ValueStock(
                        name: tran,
                        color: Colors.blue,
                      ),
                      ValueStock(
                        name: thamchieu,
                        color: Colors.pink,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                san,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                khoiluong,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
