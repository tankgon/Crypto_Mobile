// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:movie_flutter/src/widgets/input_number.dart';

import '../../../widgets/gradient_button.dart';
import '../../../widgets/input_token.dart';

class BottonSheet extends StatelessWidget {
  const BottonSheet({Key? key, this.size}) : super(key: key);
  final size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height / 2,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'Nạp tiền',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: const [
                      InputToken(),
                      TextNumber(),
                      GradientButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
