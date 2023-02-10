import 'package:flutter/material.dart';
import 'package:movie_flutter/src/modules/stock/stock.dart';
import 'package:movie_flutter/src/modules/selectCinema/select_cinema_page.dart';
import 'package:movie_flutter/src/modules/setting/setting.dart';
import '../../widgets/gradien_text.dart';
import '../../widgets/gradient_icon.dart';
import 'components/botton_sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screents = [
    const MovieDetailPage(),
    SelectCinemaPage(),
    const MovieDetailPage(),
    SelectCinemaPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreent = const MovieDetailPage();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreent,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: false,
              barrierColor: Colors.white24,
              context: context,
              backgroundColor: Colors.grey,
              builder: (BuildContext context) {
                return BottonSheet(size: size);
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.black,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreent = const MovieDetailPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 0
                            ? const GradientIcon(
                                Icons.account_tree_outlined,
                                30,
                                LinearGradient(
                                  colors: <Color>[
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              )
                            : const Icon(
                                Icons.account_tree_outlined,
                                color: Colors.grey,
                              ),
                        currentTab == 0
                            ? const GradientText(
                                'Stock',
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                ),
                              )
                            : const Text(
                                'Stock',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreent = SelectCinemaPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 1
                            ? const GradientIcon(
                                Icons.bar_chart,
                                30,
                                LinearGradient(
                                  colors: <Color>[
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              )
                            : const Icon(
                                Icons.bar_chart,
                                color: Colors.grey,
                              ),
                        currentTab == 1
                            ? const GradientText(
                                'Chart',
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                ),
                              )
                            : const Text(
                                'Chart',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreent = SelectCinemaPage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 2
                            ? const GradientIcon(
                                Icons.verified_user_sharp,
                                30,
                                LinearGradient(
                                  colors: <Color>[
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              )
                            : const Icon(
                                Icons.verified_user_sharp,
                                color: Colors.grey,
                              ),
                        currentTab == 2
                            ? const GradientText(
                                'Profile',
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                ),
                              )
                            : const Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreent = const Setting();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 3
                            ? const GradientIcon(
                                Icons.settings_outlined,
                                30,
                                LinearGradient(
                                  colors: <Color>[
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              )
                            : const Icon(
                                Icons.settings_outlined,
                                color: Colors.grey,
                              ),
                        currentTab == 3
                            ? const GradientText(
                                'Setting',
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff8AD4EC),
                                    Color(0xffEF96FF),
                                    Color(0xffFF56A9),
                                    Color(0xffFFAA6C),
                                  ],
                                ),
                              )
                            : const Text(
                                'Setting',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
