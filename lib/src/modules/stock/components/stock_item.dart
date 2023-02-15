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
  final String name;
  final String san;
  final String sann;
  final String tran;
  final String thamchieu;
  final String khoiluong;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(16)),
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
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 2.5,
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueStock(
                        name: sann,
                        color: Colors.yellowAccent,
                      ),
                      ValueStock(
                        name: tran,
                        color: Colors.blueAccent,
                      ),
                      ValueStock(
                        name: thamchieu,
                        color: Colors.pinkAccent,
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
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                khoiluong,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
