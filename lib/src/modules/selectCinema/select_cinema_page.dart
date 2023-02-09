import 'package:flutter/material.dart';

import '../../models/time.dart';
import '../../widgets/buiding_title_select_page.dart';
import 'components/central.dart';
import 'components/choose_date.dart';

class SelectCinemaPage extends StatelessWidget {
  SelectCinemaPage({super.key});

  final List<ITimes> time1 = [
    ITimes('12:20', 'ide'),
    ITimes('14:20', 'busy'),
    ITimes('16:40', 'active'),
    ITimes('20:45', 'ide'),
  ];

  final List<ITimes> time2 = [
    ITimes('12:20', 'ide'),
    ITimes('14:20', 'ide'),
    ITimes('16:40', 'busy'),
    ITimes('20:45', 'ide'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                height: size.height / 10,
                child: const Center(
                  child: Text(
                    'Ralph Breaks the\nInternet',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 30,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            height: size.height / 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)),
            child: Row(
              children: const [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: ('Select Your Contry'),
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white70,
                        ),
                      )),
                )),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.white,
                    size: 36,
                  ),
                )
              ],
            ),
          ),
          const BuidingTitleSelectPage(content: 'Choose Date'),
          ChooseDate(size: size),
          const BuidingTitleSelectPage(content: 'Central Park CGV'),
          Central(size: size, time: time2),
          const BuidingTitleSelectPage(content: 'FX Sudirman XXI'),
          Central(size: size, time: time1),
          const BuidingTitleSelectPage(content: 'Kelapa Gading IMAX'),
          Central(size: size, time: time1),
          //bottom
          // Container(
          //   margin: const EdgeInsets.only(top: 16),
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //         shape: const CircleBorder(),
          //         backgroundColor: Colors.grey,
          //         padding: const EdgeInsets.all(20)),
          //     child: const Icon(
          //       Icons.navigate_next_outlined,
          //       color: Colors.white,
          //       size: 30,
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }
}
