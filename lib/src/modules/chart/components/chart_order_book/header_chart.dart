import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/buy_page.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/sale_page.dart';

import '../../../../styles/widgets/gradien_text.dart';
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
            style: AppTextStyles.h4,
            gradient: AppColors.gradienText,
          ),
          Container(
            width: size.width / 1.8,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ValueStock(
                  name: '12.45',
                  color: AppColors.yellow,
                ),
                ValueStock(
                  name: '20.34',
                  color: AppColors.blue,
                ),
                ValueStock(
                  name: '17.93',
                  color: AppColors.red,
                ),
              ],
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
                                builder: (context) => const BuyPage()));
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
                                builder: (context) => const SalePage()));
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
