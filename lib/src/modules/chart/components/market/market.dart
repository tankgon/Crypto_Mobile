// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/src/models/market.dart';
import 'package:movie_flutter/src/models/market_response.dart';

import '../../../../styles/themes/app_colors.dart';
import '../../../../styles/widgets/loading_widget.dart';
import '../../bloc/chart_bloc.dart';
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
  State<StatefulWidget> createState() => _MarketWidgetState();
}

class _MarketWidgetState extends State<MarketWidget> {
  final ChartBloc _ListMarket = ChartBloc();
  @override
  void initState() {
    super.initState();
    _ListMarket.add(GetMarketList(widget.symbolStock));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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

              child: BlocProvider(
                    create: (_) => _ListMarket,
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
                        } else if (state is ChartMarketLoaded) {
                          return _buildOrderItem(widget.size, state.market);
                        } else if (state is ChartError) {
                          return ErrorWidget(state.message);
                        } else {
                          return Container();
                        }
                      },
                    ))),
            )
        ]),
      ),
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
