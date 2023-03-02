// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/order_book_sale.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../../../network/models/response/get_kLineChart_report.dart';
import '../../../../network/repositories/api_v1/kline_chart_repo.dart';
import 'order_book_buy.dart';

class ContentChart extends StatelessWidget {
  const ContentChart({
    Key? key,
    required this.size,
    required this.symbolStock,
  }) : super(key: key);

  final Size size;
  final String? symbolStock;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: KLineChartRepoImpl()
                .getKLineChartReport(path: symbolStock.toString()),
            builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, bottom: 20, top: 20),
                    height: size.height / 2.5,
                    width: size.width / 1.1,
                    child: SfCartesianChart(
                      series: <CandleSeries>[
                        CandleSeries<KLineChartResData, DateTime>(
                          dataSource: snapshot.data?.charts ?? [],
                          xValueMapper: (KLineChartResData sales, _) => sales.x,
                          lowValueMapper: (KLineChartResData sales, _) =>
                              sales.low,
                          highValueMapper: (KLineChartResData sales, _) =>
                              sales.high,
                          openValueMapper: (KLineChartResData sales, _) =>
                              sales.open,
                          closeValueMapper: (KLineChartResData sales, _) =>
                              sales.close,
                        )
                      ],
                      plotAreaBorderWidth: 0,
                      primaryXAxis: DateTimeAxis(
                        dateFormat: DateFormat.yMd(),
                        majorGridLines: const MajorGridLines(width: 0),
                      ),
                      primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.1),
                          minimum: 0,
                          maximum: 100,
                          interval: 20,
                          numberFormat:
                              NumberFormat.simpleCurrency(decimalDigits: 0)),
                    ),
                  ),
                ],
              );
            },
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
