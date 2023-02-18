import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';

import '../../../../widgets/input_number.dart';
import '../../../../widgets/input_string.dart';

class SalePage extends StatelessWidget {
  const SalePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                        'Bán cổ phiếu',
                        style: AppTextStyles.h2,
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
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 8),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: AppColors.white70,
                            ),
                          ),
                          Text(
                            'BTC',
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
                height: size.height / 1.7,
                child: Column(
                  children: const [
                    InputToken(
                      label: "Xác nhận Token",
                    ),
                    TextNumber(lable: 'Số lượng bán', suffix: '.000 VND'),
                    TextNumber(lable: 'Khối lượng bán', suffix: ''),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.red,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Bán', style: AppTextStyles.h2),
                          ),
                        ),
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
