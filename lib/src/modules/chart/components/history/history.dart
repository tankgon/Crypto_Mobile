import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/src/models/list_order.dart';
import 'package:movie_flutter/src/models/list_order_response.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

import '../../get_list_order_bloc.dart';
import 'item_history.dart';

class History extends StatefulWidget {
  const History({
    Key? key,
    required this.size,
    this.symbolStock,
  }) : super(key: key);

  final Size size;
  final String? symbolStock;
  @override
  State<History> createState() => _HistoryState(symbolStock);
}

class _HistoryState extends State<History> {
  final String? symbolStock;
  _HistoryState(this.symbolStock);
  @override
  void initState() {
    super.initState();
    listHistory.getHistorys(symbolStock);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
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
              style: AppTextStyles.h1C,
            ),
            Text(
              'Trạng thái',
              style: AppTextStyles.h1C,
            ),
            Text(
              'SL đầu',
              style: AppTextStyles.h1C,
            ),
            Text(
              'Thời gian',
              style: AppTextStyles.h1C,
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
          child: StreamBuilder<ListOrderResponse>(
              stream: listHistory.subject.stream,
              builder: (context, AsyncSnapshot<ListOrderResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error.isNotEmpty) {
                    return _buildErrorWidget(snapshot.data!.error);
                  }
                  return _buildListHistory(widget.size, snapshot.data!);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error.toString());
                } else {
                  return _buildLoadingWidget();
                }
              }),
        ),
      ]),
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

Widget _buildListHistory(Size size, ListOrderResponse data) {
  final List<ListOrder> stockInit = data.listOrder;
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: stockInit.length,
    itemBuilder: (context, index) {
      return ItemHistory(
        size: size,
        amount: stockInit[index].originalCoinAmount,
        price: stockInit[index].pricePerUnit,
        state: stockInit[index].state == 'enabled' ? 'mở' : 'thành công',
        time: DateFormat.MEd()
            .format(stockInit[index].createdAt ?? DateTime.now()),
        color: stockInit[index].type == 'ask' ? AppColors.green : AppColors.red,
      );
    },
  );
}
