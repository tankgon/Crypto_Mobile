// ignore_for_file: no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/src/models/list_order.dart';
import 'package:movie_flutter/src/models/list_order_response.dart';
import 'package:movie_flutter/src/modules/chart/components/command/row_item.dart';
import '../../../../config/api/crypto_repository.dart';
import '../../../../styles/themes/app_colors.dart';
import 'package:intl/intl.dart';
import '../../../../styles/widgets/loading_widget.dart';
import '../../bloc/chart_bloc.dart';

class Command extends StatefulWidget {
  const Command({
    Key? key,
    required this.size,
    this.symbolStock,
  }) : super(key: key);
  final Size size;
  final String? symbolStock;
  @override
  State<StatefulWidget> createState() => _CommandState();
}

class _CommandState extends State<Command> {
  final ChartBloc _ListOrders = ChartBloc();

  @override
  void initState() {
    _ListOrders.add(GetOrderList(widget.symbolStock));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: BlocProvider(
            create: (_) => _ListOrders,
            child:
                BlocListener<ChartBloc, ChartState>(listener: (context, state) {
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
                  return _buildOrderItem(widget.size, state.data);
                } else if (state is ChartError) {
                  return ErrorWidget(state.message);
                } else {
                  return Container();
                }
              },
            ))));
  }
}

Widget _buildOrderItem(Size size, ListOrderResponse data) {
  final List<ListOrder> listOrderInit = data.listOrder;
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listOrderInit.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: listOrderInit[index].type == 'bid'
                      ? AppColors.originGreen
                      : AppColors.originRed,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(children: [
                        RowItem(
                            name: 'Giá :',
                            number: listOrderInit[index].pricePerUnit),
                        RowItem(
                            name: 'SL :',
                            number: listOrderInit[index].coinAmount),
                        RowItem(
                            name: 'Time :',
                            number: DateFormat.MEd().format(
                                listOrderInit[index].createdAt ??
                                    DateTime.now())),
                      ]),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        height: size.height / 13,
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const RowItem(name: 'Trạng thái :', number: 'mở'),
                            RowItem(
                                name: 'SL đầu :',
                                number:
                                    listOrderInit[index].originalCoinAmount),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          CryptoRepository()
                              .postCancleOrder(listOrderInit[index].orderId);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.yellow,
                          ),
                          height: 38,
                          child: const Icon(
                            Icons.close,
                            color: AppColors.black,
                          ),
                        ),
                      )),
                ],
              )),
        );
      });
}
