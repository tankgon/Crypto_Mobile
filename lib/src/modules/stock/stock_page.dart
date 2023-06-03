import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/src/models/stock_response.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import '../../styles/widgets/loading_widget.dart';
import '../chart/chart_page.dart';
import 'bloc/stock_bloc.dart';
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
  final StockBloc _stockBloc = StockBloc();

  @override
  void initState() {
    _stockBloc.add(GetStockList());
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
          SizedBox(height: size.height, child: _buildListStock(size))
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

  Widget _buildListStock(Size size) {
    // final List<Stock> stockInit = data.stock;
    return Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 100),
        child: BlocProvider(
            create: (_) => _stockBloc,
            child:
                BlocListener<StockBloc, StockState>(listener: (context, state) {
              if (state is StockError) {
                ErrorWidget(state.message);
              }
            }, child: BlocBuilder<StockBloc, StockState>(
              builder: (context, state) {
                if (state is StockInitial) {
                  return const LoadingWidget();
                } else if (state is StockLoading) {
                  return const LoadingWidget();
                } else if (state is StockLoaded) {
                  return _buildStock(context, state.stock, size);
                } else if (state is StockError) {
                  return ErrorWidget(state.message);
                } else {
                  return Container();
                }
              },
            ))));
  }

  Widget _buildStock(BuildContext context, StockResponse stock, Size size) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: stock.stock.length,
      itemBuilder: (context, index) {
        if (stock.stock[index].symbol == "VND") {
          return const SizedBox.shrink();
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChartPage(
                      symbolStock: stock.stock[index].symbol,
                      nameStock: stock.stock[index].name)),
            );
          },
          child: StockItem(
            size: size,
            name: stock.stock[index].symbol,
          ),
        );
      },
    );
  }
}
