import 'package:flutter/material.dart';
import 'package:movie_flutter/src/modules/stock/components/value_stock.dart';
import 'package:movie_flutter/src/network/repositories/api_v1/sessions_repo_impl.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

class StockItem extends StatefulWidget {
  const StockItem({
    Key? key,
    required this.size,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String name;

  @override
  State<StockItem> createState() => _StockItemState();
}

class _StockItemState extends State<StockItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: const EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
            color: AppColors.white10, borderRadius: BorderRadius.circular(10)),
        child: FutureBuilder(
          future: SesionsRepoImpl().getCurrentReport(path: widget.name),
          builder: (context, snapshot) {
            final String ceilPrice =
                (double.tryParse(snapshot.data?.data.ceilPrice ?? "0") ?? 0)
                    .toStringAsFixed(2);
            final String floorPrice =
                (double.tryParse(snapshot.data?.data.floorPrice ?? "0") ?? 0)
                    .toStringAsFixed(2);
            final String refPrice =
                (double.tryParse(snapshot.data?.data.refPrice ?? "0") ?? 0)
                    .toStringAsFixed(2);
            final String highestPrice =
                (double.tryParse(snapshot.data?.data.highestPrice ?? "0") ?? 0)
                    .toStringAsFixed(2);
            final String lowestPrice = snapshot.data?.data.lowestPrice ==
                    "99999999"
                ? "0"
                : (double.tryParse(snapshot.data?.data.lowestPrice ?? "0") ?? 0)
                    .toStringAsFixed(2);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: AppTextStyles.h1W),
                      Container(
                        width: widget.size.width / 2.5,
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ValueStock(
                              name: ceilPrice,
                              color: AppColors.yellow,
                            ),
                            ValueStock(
                              name: refPrice,
                              color: AppColors.blue,
                            ),
                            ValueStock(
                              name: floorPrice,
                              color: AppColors.pink,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      highestPrice,
                      style: AppTextStyles.h1W,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        lowestPrice,
                        style: AppTextStyles.h1W,
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ));
  }
}
