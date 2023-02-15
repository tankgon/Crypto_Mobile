import 'package:flutter/material.dart';
import '../../models/chart.dart';
import 'components/chart/content_chart.dart';
import 'components/chart/header_chart.dart';
import 'components/command/command.dart';
import 'components/history/history.dart';
import 'components/market/item_market.dart';

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
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                      unselectedLabelStyle:
                          const TextStyle(color: Colors.black, fontSize: 16),
                      indicatorColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _chartController,
                      children: [
                        ContentChart(size: size, chartDagta: _chartDagta),
                        Command(size: size),
                        History(size: size),
                        SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Giá',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 16),
                                ),
                                Text(
                                  'Số Lượng',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 16),
                                ),
                                Text(
                                  'Thời gian',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 16),
                                ),
                              ],
                            ),
                            Container(
                              width: size.width,
                              height: 1,
                              color: Colors.white54,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            const ItemMarket(
                              price: '23',
                              amount: '10',
                              time: '12:54',
                              color: Colors.greenAccent,
                            ),
                            const ItemMarket(
                              price: '223',
                              amount: '140',
                              time: '12:54',
                              color: Colors.greenAccent,
                            ),
                            const ItemMarket(
                              price: '223',
                              amount: '10',
                              time: '12:54',
                              color: Colors.redAccent,
                            ),
                            const ItemMarket(
                              price: '213',
                              amount: '10',
                              time: '12:54',
                              color: Colors.greenAccent,
                            ),
                          ]),
                        ))
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
