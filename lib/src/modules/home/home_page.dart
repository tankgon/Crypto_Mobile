import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';
import 'package:movie_flutter/src/modules/profile/profile.dart';
import 'package:movie_flutter/src/modules/stock/stock.dart';
import 'package:movie_flutter/src/modules/setting/setting.dart';
import '../../widgets/gradien_text.dart';
import '../../widgets/gradient_icon.dart';
import '../chart/chart.dart';
import 'components/botton_sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;

  final List<Widget> screents = [
    const Chart(),
    const Setting(),
    const Profile(),
    const Stock(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreent = const Stock();
  @override
  Widget build(BuildContext context) {
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
              context: context,
              builder: (BuildContext context) {
                return const BottonSheet();
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: AppColors.black,
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
                        currentScreent = const Stock();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 0
                            ? const GradientIcon(Icons.account_tree_outlined,
                                30, AppColors.gradienIcon)
                            : const Icon(
                                Icons.account_tree_outlined,
                                color: AppColors.grey,
                              ),
                        currentTab == 0
                            ? const GradientText('Stock',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'Stock',
                                style: TextStyle(
                                  color: AppColors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreent = const Chart();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 1
                            ? const GradientIcon(
                                Icons.bar_chart, 30, AppColors.gradienIcon)
                            : const Icon(
                                Icons.bar_chart,
                                color: AppColors.grey,
                              ),
                        currentTab == 1
                            ? const GradientText('Chart',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'Chart',
                                style: TextStyle(
                                  color: AppColors.grey,
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
                        currentScreent = const Profile();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 2
                            ? const GradientIcon(Icons.verified_user_sharp, 30,
                                AppColors.gradienIcon)
                            : const Icon(
                                Icons.verified_user_sharp,
                                color: AppColors.grey,
                              ),
                        currentTab == 2
                            ? const GradientText('Profile',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'Profile',
                                style: TextStyle(
                                  color: AppColors.grey,
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
                            ? const GradientIcon(Icons.settings_outlined, 30,
                                AppColors.gradienIcon)
                            : const Icon(
                                Icons.settings_outlined,
                                color: AppColors.grey,
                              ),
                        currentTab == 3
                            ? const GradientText('Setting',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'Setting',
                                style: TextStyle(
                                  color: AppColors.grey,
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
