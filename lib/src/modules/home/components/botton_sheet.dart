import 'package:flutter/material.dart';
import 'package:movie_flutter/src/modules/home/components/text_number.dart';

import '../../../config/themes/gradient_button.dart';

class BottonSheet extends StatelessWidget {
  const BottonSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
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
                    children: const [TextNumber(), GradientButton()],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
