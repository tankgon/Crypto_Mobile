import 'package:flutter/material.dart';
import 'package:movie_flutter/src/modules/stock/components/stock_item.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/buy_page.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/sale_page.dart';

import '../../../../styles/widgets/gradien_text.dart';

class HeaderChart extends StatelessWidget {
  const HeaderChart({
    Key? key,
    required this.size,
    required this.nameStock,
    required this.symbolStock,
  }) : super(key: key);

  final Size size;
  final String? nameStock;
  final String? symbolStock;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          GradientText(
            nameStock ?? '',
            style: AppTextStyles.h3,
            gradient: AppColors.gradienText,
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: StockItem(
              size: size,
              name: symbolStock.toString(),
            ),
          ),
          SizedBox(
            width: size.width / 1.12,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BuyPage(symbolStock: symbolStock)));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Mua', style: AppTextStyles.h2),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SalePage(symbolStock: symbolStock)));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Bán', style: AppTextStyles.h2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
