import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';
import 'components/background_widget.dart';
import 'components/stock_item.dart';

class Stock extends StatefulWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() => _StockPageState();
}

class _StockPageState extends State<Stock> with SingleTickerProviderStateMixin {
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
          Container(height: size.height, decoration: AppColors.gradientMain),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.none,
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
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        color: AppColors.white,
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
                    style: AppTextStyles.h1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.white,
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
          style: AppTextStyles.h2,
        ));
  }
}
