// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/list_order.dart';
import 'package:movie_flutter/src/models/list_order_response.dart';
import 'package:movie_flutter/src/modules/chart/components/command/row_item.dart';
import 'package:movie_flutter/src/modules/chart/get_list_order_bloc.dart';
import '../../../../config/api/crypto_repository.dart';
import '../../../../styles/themes/app_colors.dart';
import 'package:intl/intl.dart';

class Command extends StatefulWidget {
  const Command({
    Key? key,
    required this.size,
    this.symbolStock,
  }) : super(key: key);
  final Size size;
  final String? symbolStock;
  @override
  State<StatefulWidget> createState() => _CommandState(symbolStock);
}

class _CommandState extends State<Command> {
  final String? symbolStock;
  _CommandState(this.symbolStock);

  @override
  void initState() {
    super.initState();
    listOrdersBloc.getListOrders(symbolStock);
  }
  // @override
  // void incrementCounter() {
  //   setState(() {
  //     listOrdersBloc.getListOrders(symbolStock);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: StreamBuilder<ListOrderResponse>(
            stream: listOrdersBloc.subject.stream,
            builder: (context, AsyncSnapshot<ListOrderResponse> snapshot) {
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
            }));
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
