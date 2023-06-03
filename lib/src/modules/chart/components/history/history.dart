// ignore_for_file: no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/src/models/list_order.dart';
import 'package:movie_flutter/src/models/list_order_response.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import '../../../../styles/widgets/loading_widget.dart';
import '../../bloc/chart_bloc.dart';
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
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final ChartBloc _ListHistory = ChartBloc();

  @override
  void initState() {
    super.initState();
    _ListHistory.add(GetHistoryList(widget.symbolStock));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
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
            height: widget.size.height / 2,
            child: BlocProvider(
                create: (_) => _ListHistory,
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
                    } else if (state is ChartDataLoaded) {
                      return _buildListHistory(widget.size, state.data);
                    } else if (state is ChartError) {
                      return ErrorWidget(state.message);
                    } else {
                      return Container();
                    }
                  },
                ))))
      ]),
    ));
  }
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
        state: stockInit[index].state == 'enabled' ? 'đang mở' : 'thành công',
        time: DateFormat.MEd()
            .format(stockInit[index].createdAt ?? DateTime.now()),
        color: stockInit[index].type == 'bid' ? AppColors.green : AppColors.red,
      );
    },
  );
}
