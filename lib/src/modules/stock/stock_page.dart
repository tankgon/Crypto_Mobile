import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/stock_response.dart';
import 'package:movie_flutter/src/modules/chart/chart_page.dart';
import 'package:movie_flutter/src/modules/stock/get_stock_bloc.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import '../../models/stock.dart';
import 'components/background_widget.dart';
import 'components/stock_item.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key, this.nameStock}) : super(key: key);
  final String? nameStock;
  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    stocksBloc.getStocks();
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
                onPressed: () {
                  // CryptoRepository().getTokenData();
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.none),
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
          SizedBox(
            height: size.height,
            child: StreamBuilder<StockResponse>(
              stream: stocksBloc.subject.stream,
              builder: (context, AsyncSnapshot<StockResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error.isNotEmpty) {
                    return _buildErrorWidget(snapshot.data!.error);
                  }
                  return _buildListStock(size, snapshot.data!);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error.toString());
                } else {
                  return _buildLoadingWidget();
                }
              },
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
        mainAxisAlignment: MainAxisAlignment.center,
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

Widget _buildListStock(Size size, StockResponse data) {
  final List<Stock> stockInit = data.stock;
  return Padding(
    padding: const EdgeInsets.only(top: 60),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: stockInit.length,
      itemBuilder: (context, index) {
        if (stockInit[index].symbol == "VND") {
          return const SizedBox.shrink();
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChartPage(
                      symbolStock: stockInit[index].symbol,
                      nameStock: stockInit[index].name)),
            );
          },
          child: StockItem(
            size: size,
            name: stockInit[index].symbol,
          ),
        );
      },
    ),
  );
}
