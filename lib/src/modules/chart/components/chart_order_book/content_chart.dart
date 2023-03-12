// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/order.dart';
import 'package:movie_flutter/src/models/order_response.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/order_book_sale.dart';
import 'package:movie_flutter/src/modules/chart/get_order_bloc.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../../../network/models/response/get_kLineChart_report.dart';
import '../../../../network/repositories/api_v1/kline_chart_repo.dart';
import 'order_book_buy.dart';

class ContentChart extends StatefulWidget {
  const ContentChart({Key? key, required this.size, required this.symbolStock})
      : super(key: key);
  final Size size;
  final String? symbolStock;

  @override
  State<ContentChart> createState() => _ContentChartState(symbolStock);
}

class _ContentChartState extends State<ContentChart> {
  final String? symbolStock;
  _ContentChartState(this.symbolStock);
  late double? minimum;
  late double? maximum;
  @override
  void initState() {
    super.initState();
    orderBooksBlocBid.getOrders(symbolStock, "bid");
    orderBooksBlocAsk.getOrders(symbolStock, "ask");
    KLineChartRepoImpl().getKLineChartReport();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: KLineChartRepoImpl()
                .getKLineChartReport(path: widget.symbolStock.toString()),
            builder: (context, snapshot) {
              // if (snapshot.hasData) {
              //   if (snapshot.data != null) {
              //     final String dataMin = snapshot.data?.charts
              //             .reduce((e, min) {
              //               if (min.low! < e.low!) {
              //                 return min;
              //               } else {
              //                 return e;
              //               }
              //             })
              //             .low
              //             .toString() ??
              //         '';
              //     minimum = double.tryParse(dataMin) ?? 0;
              //   } else if (snapshot.hasError) {
              //     return _buildErrorWidget(snapshot.error.toString());
              //   } else {
              //     return _buildLoadingWidget();
              //   }
              // }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, bottom: 20, top: 20),
                    height: widget.size.height / 2.5,
                    width: widget.size.width / 1.1,
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
                          // minimum: minimum,
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
            width: widget.size.width / 1.2,
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Bên mua',
                        style: AppTextStyles.h1C,
                      ),
                    ),
                    Container(
                        height: widget.size.height,
                        padding: const EdgeInsets.only(right: 10),
                        child: StreamBuilder<OrderResponse>(
                            stream: orderBooksBlocBid.subject.stream,
                            builder: (context,
                                AsyncSnapshot<OrderResponse> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.error.isNotEmpty) {
                                  return _buildErrorWidget(
                                      snapshot.data!.error);
                                }
                                return _buildListOrderBookBid(
                                    widget.size, snapshot.data!);
                              } else if (snapshot.hasError) {
                                return _buildErrorWidget(
                                    snapshot.error.toString());
                              } else {
                                return _buildLoadingWidget();
                              }
                            }))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Bên bán',
                        style: AppTextStyles.h1C,
                      ),
                    ),
                    Container(
                        height: widget.size.height,
                        padding: const EdgeInsets.only(right: 10),
                        child: StreamBuilder<OrderResponse>(
                            stream: orderBooksBlocAsk.subject.stream,
                            builder: (context,
                                AsyncSnapshot<OrderResponse> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.error.isNotEmpty) {
                                  return _buildErrorWidget(
                                      snapshot.data!.error);
                                }
                                return _buildListOrderBookAsk(
                                    widget.size, snapshot.data!);
                              } else if (snapshot.hasError) {
                                return _buildErrorWidget(
                                    snapshot.error.toString());
                              } else {
                                return _buildLoadingWidget();
                              }
                            }))
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

Widget _buildListOrderBookAsk(Size size, OrderResponse data) {
  final List<Order> orderInit = data.order;
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: orderInit.length,
    itemBuilder: (context, index) {
      return OrderBookSale(
        mass: orderInit[index].coinAmount,
        amount: orderInit[index].pricePerUnit,
        color: AppColors.red,
      );
    },
  );
}

Widget _buildListOrderBookBid(Size size, OrderResponse data) {
  final List<Order> orderInit = data.order;
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: orderInit.length,
    itemBuilder: (context, index) {
      return OrderBookBuy(
        mass: orderInit[index].pricePerUnit,
        amount: orderInit[index].coinAmount,
        color: AppColors.green,
      );
    },
  );
}

Widget _buildErrorWidget(String error) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Error occured: $error"),
    ],
  ));
}

Widget _buildLoadingWidget() {
  return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )
        ],
      ));
}
