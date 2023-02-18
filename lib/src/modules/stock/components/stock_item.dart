import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';
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
          color: AppColors.white10, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.h1W),
                Container(
                  width: size.width / 2.5,
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueStock(
                        name: sann,
                        color: AppColors.yellow,
                      ),
                      ValueStock(
                        name: tran,
                        color: AppColors.blue,
                      ),
                      ValueStock(
                        name: thamchieu,
                        color: AppColors.red,
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
                style: AppTextStyles.h1W,
              ),
              Text(
                khoiluong,
                style: AppTextStyles.h1W,
              ),
            ],
          )
        ],
      ),
    );
  }
}
