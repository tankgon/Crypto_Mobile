import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

import '../../styles/widgets/gradien_text.dart';
import 'Components/item_information.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: size.height / 25,
                backgroundImage: const NetworkImage(
                    "https://source.unsplash.com/random/200x200?sig=incrementingIdentifier"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    GradientText('Thanh ne',
                        style: AppTextStyles.h3,
                        gradient: AppColors.gradienIcon),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        '0338091539',
                        style: AppTextStyles.h1C,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        ItemInformation(
          size: size,
          label: 'Số dư khả dụng',
          money: '123123123',
        ),
        ItemInformation(
          size: size,
          label: 'Số dư giao dịch',
          money: '123123123',
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24),
              child: Table(
                textDirection: TextDirection.rtl,
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                border: TableBorder.all(
                    borderRadius: BorderRadius.circular(10),
                    width: 1.0,
                    color: AppColors.white54),
                children: const [
                  TableRow(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(16, 33, 149, 243),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Cổ phiếu khóa", textScaleFactor: 1.2),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Cổ phiếu hợp lệ", textScaleFactor: 1.2),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Cổ phiếu", textScaleFactor: 1.2),
                        ),
                      ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "0",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: AppColors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "123123",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: AppColors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("ACB", textScaleFactor: 1.2),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "1234",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: AppColors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "1421432",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: AppColors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("TCB", textScaleFactor: 1.2),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "0",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: AppColors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "45",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: AppColors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("VCB", textScaleFactor: 1.2),
                    ),
                  ]),
                ],
              ),
            )
          ],
        )
      ]),
    ));
  }
}
