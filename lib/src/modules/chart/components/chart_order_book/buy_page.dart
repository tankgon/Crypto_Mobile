import 'package:flutter/material.dart';
import 'package:movie_flutter/src/modules/home/home_page.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import '../../../../config/api/crypto_repository.dart';
import '../../../../styles/widgets/input_number_widget.dart';
import '../../../../styles/widgets/input_string_widget.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({
    Key? key,
    this.symbolStock,
  }) : super(key: key);

  final String? symbolStock;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final price = TextEditingController();
    final amount = TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: size.height / 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height / 16,
                    child: const Center(
                      child: Text(
                        'Mua cổ phiếu',
                        style: AppTextStyles.h1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: IconButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      icon: const Icon(Icons.arrow_back),
                      color: AppColors.white,
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                height: size.height / 14,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white54)),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 8),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: AppColors.white70,
                            ),
                          ),
                          Text(
                            symbolStock.toString(),
                            style: AppTextStyles.h2W,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: AppColors.white,
                        size: 36,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  children: [
                    // const InputToken(
                    //   label: "Xác nhận Token",
                    // ),
                    TextNumber(
                        controller: price,
                        lable: 'Giá mua',
                        suffix: '.000 VND'),
                    TextNumber(
                        controller: amount, lable: 'Số lượng mua', suffix: ''),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.originGreen,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage(),
                      ),
                      (route) => false,
                    );
                    CryptoRepository().postCreateOrderBid(
                      symbolStock,
                      int.tryParse(price.text),
                      int.tryParse(amount.text),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Mua',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
