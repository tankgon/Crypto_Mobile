import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/api/crypto_repository.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';
import '../../../styles/widgets/gradient_button_widget.dart';
import '../../../styles/widgets/input_number_widget.dart';
import '../../../styles/widgets/input_string_widget.dart';

class BottonSheet extends StatefulWidget {
  const BottonSheet({Key? key, this.loginResData}) : super(key: key);

  final String? loginResData;
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
    final amountDeposit = TextEditingController();
    final amountWithdraw = TextEditingController();

    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 1.2,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TabBar(
              tabs: const [Tab(text: 'Nạp'), Tab(text: 'Rút')],
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
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const InputToken(
                        label: "Xác nhận Token",
                        controller: null,
                         obscureText: false
                      ),
                      TextNumber(
                          lable: 'Số lượng nạp',
                          suffix: '.000 VND',
                          controller: amountDeposit),
                      GradientButton(
                        name: 'Nạp',
                        even: () {
                          CryptoRepository()
                              .postdeposit(int.tryParse(amountDeposit.text));
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const InputToken(
                        label: "Xác nhận Token",
                        controller: null,
                         obscureText: false
                      ),
                      TextNumber(
                          lable: 'Số lượng rút',
                          suffix: '.000 VND',
                          controller: amountWithdraw),
                      GradientButton(
                        name: 'Rút',
                        even: () {
                          CryptoRepository()
                              .postWithdraw(int.tryParse(amountWithdraw.text));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
