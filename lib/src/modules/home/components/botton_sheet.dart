import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/config/themes/app_text_styles.dart';

import '../../../widgets/gradient_button.dart';
import '../../../widgets/input_number.dart';
import '../../../widgets/input_string.dart';

class BottonSheet extends StatefulWidget {
  const BottonSheet({Key? key}) : super(key: key);
  @override
  State<BottonSheet> createState() => _BottonSheet();
}

class _BottonSheet extends State<BottonSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabControl;

  @override
  void initState() {
    super.initState();
    _tabControl = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height / 1.9,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height / 1.6,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: TabBar(
                      tabs: const [Tab(text: 'Admit'), Tab(text: 'Withdraw')],
                      controller: _tabControl,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: AppTextStyles.h2,
                      indicatorColor: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabControl,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: const [
                              InputToken(
                                label: "Xác nhận Token",
                              ),
                              TextNumber(
                                  lable: 'Số lượng nạp', suffix: '.000 VND'),
                              GradientButton(
                                name: 'Nạp',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: const [
                              InputToken(
                                label: "Xác nhận Token",
                              ),
                              TextNumber(
                                  lable: 'Số lượng rút', suffix: '.000 VND'),
                              GradientButton(
                                name: 'Rút',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
