import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/src/models/market.dart';
import 'package:movie_flutter/src/models/market_response.dart';

import '../../../../styles/themes/app_colors.dart';
import '../../get_market_bloc.dart';
import 'item_market.dart';

class MarketWidget extends StatefulWidget {
  const MarketWidget({
    Key? key,
    required this.size,
    this.symbolStock,
  }) : super(key: key);

  final Size size;
  final String? symbolStock;

  @override
  State<StatefulWidget> createState() => _MarketWidgetState(symbolStock);
}

class _MarketWidgetState extends State<MarketWidget> {
  final String? symbolStock;
  _MarketWidgetState(this.symbolStock);
  @override
  void initState() {
    super.initState();
    marketBloc.getMarket(symbolStock);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(children: [
        Container(
          width: widget.size.width,
          height: 1,
          color: AppColors.white54,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Giá',
              style: TextStyle(color: AppColors.white54, fontSize: 16),
            ),
            Text(
              'Số Lượng',
              style: TextStyle(color: AppColors.white54, fontSize: 16),
            ),
            Text(
              'Thời gian',
              style: TextStyle(color: AppColors.white54, fontSize: 16),
            ),
          ],
        ),
        Container(
          width: widget.size.width,
          height: 1,
          color: AppColors.white54,
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        SizedBox(
          height: widget.size.height / 2.3,
          child: StreamBuilder<MarketReponse>(
              stream: marketBloc.subject.stream,
              builder: (context, AsyncSnapshot<MarketReponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error.isNotEmpty) {
                    return _buildErrorWidget(snapshot.data!.error);
                  }
                  return _buildOrderItem(widget.size, snapshot.data!);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error.toString());
                } else {
                  return _buildLoadingWidget();
                }
              }),
        )
      ]),
    );
  }
}

Widget _buildOrderItem(Size size, MarketReponse data) {
  final List<Market> marketInit = data.market;
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: marketInit.length,
      itemBuilder: (context, index) {
        return ItemMarket(
          size: size,
          price: marketInit[index].pricePerUnit,
          amount: marketInit[index].originalCoinAmount,
          time: DateFormat.MEd()
              .format(marketInit[index].matchedAt ?? DateTime.now()),
          color:
              marketInit[index].type == 'ask' ? AppColors.green : AppColors.red,
        );
      });
}

Widget _buildErrorWidget(String error) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(error),
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
