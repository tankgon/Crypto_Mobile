// ignore_for_file: depend_on_referenced_packages, no_logic_in_create_state, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/src/models/order.dart';
import 'package:movie_flutter/src/models/order_response.dart';
import 'package:movie_flutter/src/modules/chart/components/chart_order_book/order_book_sale.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../../../network/models/response/get_kLineChart_report.dart';
import '../../../../network/repositories/api_v1/kline_chart_repo.dart';
import '../../../../styles/widgets/loading_widget.dart';
import '../../bloc/chart_bloc.dart';
import 'order_book_buy.dart';

class ContentChart extends StatefulWidget {
  const ContentChart({Key? key, required this.size, required this.symbolStock})
      : super(key: key);
  final Size size;
  final String? symbolStock;

  @override
  State<ContentChart> createState() => _ContentChartState();
}

class _ContentChartState extends State<ContentChart> {
  late final ChartBloc _chartBlocBid = ChartBloc();
  late final ChartBloc _chartBlocAsk = ChartBloc();

  late double? minimum;
  late double? maximum;

  @override
  void initState() {
    _chartBlocBid.add(GetOrderSaleList(widget.symbolStock, "bid"));
    _chartBlocAsk.add(GetOrderSaleList(widget.symbolStock, "ask"));
    KLineChartRepoImpl().getKLineChartReport();
    super.initState();
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, bottom: 10, top: 10),
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
            width: widget.size.width / 1.15,
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
                    SizedBox(
                        height: widget.size.height,
                        width: widget.size.width / 2.6,
                        child: BlocProvider(
                            create: (_) => _chartBlocBid,
                            child: BlocListener<ChartBloc, ChartState>(
                                listener: (context, state) {
                              if (state is ChartError) {
                                ErrorWidget(state.message);
                              }
                            }, child: BlocBuilder<ChartBloc, ChartState>(
                              builder: (context, state) {
                                if (state is ChartInitial) {
                                  return const LoadingWidget();
                                } else if (state is ChartLoading) {
                                  return const LoadingWidget();
                                } else if (state is ChartOrderLoaded) {
                                  return _buildListOrderBookBid(
                                    widget.size,
                                    state.chart,
                                  );
                                } else if (state is ChartError) {
                                  return ErrorWidget(state.message);
                                } else {
                                  return Container();
                                }
                              },
                            ))))
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
                    SizedBox(
                        height: widget.size.height,
                        width: widget.size.width / 2.6,
                        child: BlocProvider(
                            create: (_) => _chartBlocAsk,
                            child: BlocListener<ChartBloc, ChartState>(
                                listener: (context, state) {
                              if (state is ChartError) {
                                ErrorWidget(state.message);
                              }
                            }, child: BlocBuilder<ChartBloc, ChartState>(
                              builder: (context, state) {
                                if (state is ChartInitial) {
                                  return const LoadingWidget();
                                } else if (state is ChartLoading) {
                                  return const LoadingWidget();
                                } else if (state is ChartOrderLoaded) {
                                  return _buildListOrderBookAsk(
                                    widget.size,
                                    state.chart,
                                  );
                                } else if (state is ChartError) {
                                  return ErrorWidget(state.message);
                                } else {
                                  return Container();
                                }
                              },
                            ))))
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
