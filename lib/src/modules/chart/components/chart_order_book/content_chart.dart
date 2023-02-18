// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/order_book_sale.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../../../models/chart.dart';
import 'order_book_buy.dart';

class ContentChart extends StatelessWidget {
  const ContentChart({
    Key? key,
    required this.size,
    required List<ChartSampleData> chartDagta,
  })  : _chartDagta = chartDagta,
        super(key: key);

  final Size size;
  final List<ChartSampleData> _chartDagta;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 20, left: 10, bottom: 20, top: 20),
            height: size.height / 2.5,
            child: SfCartesianChart(
              series: <CandleSeries>[
                CandleSeries<ChartSampleData, DateTime>(
                  dataSource: _chartDagta,
                  xValueMapper: (ChartSampleData sales, _) => sales.x,
                  lowValueMapper: (ChartSampleData sales, _) => sales.low,
                  highValueMapper: (ChartSampleData sales, _) => sales.high,
                  openValueMapper: (ChartSampleData sales, _) => sales.open,
                  closeValueMapper: (ChartSampleData sales, _) => sales.close,
                )
              ],
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.MMM(),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 0.1),
                  minimum: 0,
                  maximum: 100,
                  interval: 10,
                  numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
            ),
          ),
          SizedBox(
            width: size.width / 1.2,
            child: Row(children: [
              Expanded(
                child: Container(
                  height: size.height,
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Bên mua',
                          style: AppTextStyles.h1C,
                        ),
                      ),
                      OrderBookBuy(
                        amount: '52.31',
                        mass: '20',
                        color: AppColors.green,
                      ),
                      OrderBookBuy(
                        amount: '52.31',
                        mass: '20',
                        color: AppColors.green,
                      ),
                      OrderBookBuy(
                        amount: '52.31',
                        mass: '20',
                        color: AppColors.green,
                      ),
                      OrderBookBuy(
                        amount: '52.31',
                        mass: '20',
                        color: AppColors.green,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: size.height,
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Bên bán',
                          style: AppTextStyles.h1C,
                        ),
                      ),
                      OrderBookSale(
                        amount: '52.31',
                        mass: '20',
                        color: AppColors.red,
                      ),
                      OrderBookSale(
                        amount: '52.31',
                        mass: '20',
                        color: AppColors.red,
                      ),
                      OrderBookSale(
                        amount: '52.31',
                        mass: '20',
                        color: AppColors.red,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
