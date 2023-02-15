import 'package:flutter/material.dart';
import 'components/background_widget.dart';
import 'components/stock_item.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
          child: Stack(
        children: [
          BackGroundWidget(size: size),
          Container(
            height: size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black87, Color(0xff131e30)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
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
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'BitBank Main',
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
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StockItem(
                  size: size,
                  name: "ACB",
                  san: "12.52 \$",
                  sann: '12.32',
                  tran: '20.43',
                  thamchieu: '17.32',
                  khoiluong: '231',
                ),
                StockItem(
                  size: size,
                  name: "TCB",
                  san: "20.53 \$",
                  sann: '16.12',
                  tran: '22.45',
                  thamchieu: '15.32',
                  khoiluong: '312',
                ),
                StockItem(
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
