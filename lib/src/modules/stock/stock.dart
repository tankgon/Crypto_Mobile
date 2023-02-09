// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'components/background_widget.dart';
import 'components/button_acess.dart';
import '../../config/themes/gradien_text.dart';
import 'components/value_stock.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          BackGroundWidget(size: size),
          Container(
            height: size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black87,
              Colors.black,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 44),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.transparent,
                ),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: size.height / 50,
                      backgroundImage: const NetworkImage(
                          "https://source.unsplash.com/random/200x200?sig=incrementingIdentifier"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 20),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                )),
          ),
          Container(
              width: size.width,
              margin: const EdgeInsets.only(top: 54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Etherium Main',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(top: size.height / 6),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    GradientText(
                      '9.2632 ETH',
                      style: const TextStyle(fontSize: 40),
                      gradient: LinearGradient(colors: [
                        Colors.blue.shade400,
                        Colors.blue.shade100,
                      ]),
                    ),
                    Container(
                      width: size.width / 2,
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Row(
                        children: const [
                          ValueStock(
                            name: '12.45',
                            color: Colors.yellow,
                          ),
                          ValueStock(
                            name: '20.34',
                            color: Colors.blue,
                          ),
                          ValueStock(
                            name: '17.93',
                            color: Colors.pink,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 1.15,
                      child: Row(
                        children: const [
                          ButtonAcess(
                            name: "Mua",
                            color: Colors.green,
                          ),
                          ButtonAcess(
                            name: "Bán",
                            color: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      width: size.width / 1.5,
                      child: TabBar(
                        tabs: const [
                          Tab(text: 'Token'),
                          Tab(text: 'Collectibles')
                        ],
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        indicatorColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stock(
                                size: size,
                                name: "ACB",
                                san: "12.52 \$",
                                sann: '12.32',
                                tran: '20.43',
                                thamchieu: '17.32',
                                khoiluong: '231',
                              ),
                              Stock(
                                size: size,
                                name: "TCB",
                                san: "20.53 \$",
                                sann: '16.12',
                                tran: '22.45',
                                thamchieu: '15.32',
                                khoiluong: '312',
                              ),
                              Stock(
                                size: size,
                                name: "VCB",
                                san: "54.65 \$",
                                sann: '22.32',
                                tran: '25.43',
                                thamchieu: '13.32',
                                khoiluong: '32',
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text('Review Page'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }

  Padding buildTitle(String content) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          content,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}

class Stock extends StatelessWidget {
  const Stock({
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
  final name;
  final san;
  final sann;
  final tran;
  final thamchieu;
  final khoiluong;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: size.width / 2,
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      ValueStock(
                        name: sann,
                        color: Colors.yellow,
                      ),
                      ValueStock(
                        name: tran,
                        color: Colors.blue,
                      ),
                      ValueStock(
                        name: thamchieu,
                        color: Colors.pink,
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                khoiluong,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
