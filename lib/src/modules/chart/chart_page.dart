// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import 'components/chart_order_book/content_chart.dart';
import 'components/chart_order_book/header_chart.dart';
import 'components/command/command.dart';
import 'components/history/history.dart';
import 'components/market/market.dart';

class ChartPage extends StatefulWidget {
  final String? symbolStock;
  final String? nameStock;

  const ChartPage({
    Key? key,
    required this.symbolStock,
    required this.nameStock,
  }) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState(symbolStock, nameStock);
}

class _ChartPageState extends State<ChartPage>
    with SingleTickerProviderStateMixin {
  late TabController _chartPageController;

  final String? symbolStock;
  final String? nameStock;
  _ChartPageState(this.symbolStock, this.nameStock);

  @override
  void initState() {
    _chartPageController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height / 12,
                  child: const Center(
                    child: Text(
                      'Thông tin cổ phiếu',
                      style: AppTextStyles.h1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.white,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
            HeaderChart(
              size: size,
              nameStock: nameStock,
              symbolStock: symbolStock,
            ),
            SizedBox(
              height: size.height / 1.6,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    alignment: Alignment.center,
                    width: size.width,
                    child: TabBar(
                      tabs: const [
                        Tab(text: 'Biểu đồ'),
                        Tab(text: 'Lệnh'),
                        Tab(text: 'Lịch sử'),
                        Tab(text: 'Thị trường')
                      ],
                      controller: _chartPageController,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: AppTextStyles.h2,
                      unselectedLabelStyle: AppTextStyles.h1,
                      indicatorColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _chartPageController,
                      children: [
                        ContentChart(size: size, symbolStock: symbolStock),
                        Command(size: size, symbolStock: symbolStock),
                        History(size: size, symbolStock: symbolStock),
                        MarketWidget(size: size, symbolStock: symbolStock)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
