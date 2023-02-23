import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import '../../models/chart.dart';
import 'components/chart_order_book/content_chart.dart';
import 'components/chart_order_book/header_chart.dart';
import 'components/command/command.dart';
import 'components/history/history.dart';
import 'components/market/market.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> with SingleTickerProviderStateMixin {
  late TabController _chartController;
  late List<ChartSampleData> _chartDagta;
  @override
  void initState() {
    _chartDagta = getChartData();
    _chartController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderChart(size: size),
            SizedBox(
              height: size.height / 1.6,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    width: size.width,
                    child: TabBar(
                      tabs: const [
                        Tab(text: 'Biểu đồ'),
                        Tab(text: 'Lệnh'),
                        Tab(text: 'Lịch sử'),
                        Tab(text: 'Thị trường')
                      ],
                      controller: _chartController,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: AppTextStyles.h2,
                      unselectedLabelStyle: AppTextStyles.h1,
                      indicatorColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _chartController,
                      children: [
                        ContentChart(size: size, chartDagta: _chartDagta),
                        Command(size: size),
                        History(size: size),
                        Market(size: size)
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
