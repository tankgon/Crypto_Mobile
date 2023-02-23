import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/modules/chart/components/command/row_item.dart';

class ItemCommand extends StatelessWidget {
  const ItemCommand({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);
  final Color color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(children: const [
                          RowItem(name: 'Giá :', number: '50.23'),
                          RowItem(name: 'SL :', number: '4'),
                          RowItem(name: 'SL đầu :', number: '20'),
                        ]),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                          height: size.height / 15,
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              RowItem(name: 'Trạng thái :', number: 'mở'),
                              RowItem(name: 'Thời gian :', number: '16:39'),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.orange,
                          ),
                          height: 38,
                          child: const Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                        )),
                  ],
                ))
          ],
        ));
  }
}
