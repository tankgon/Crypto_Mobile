// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/login_response.dart';
import 'package:movie_flutter/src/modules/profile/profile_page.dart';
import 'package:movie_flutter/src/modules/setting/setting_page.dart';
import 'package:movie_flutter/src/modules/stock/stock_page.dart';
import 'package:movie_flutter/src/modules/wallet/wallet_page.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import '../../config/api/crypto_repository.dart';
import '../../styles/widgets/gradien_text_widget.dart';
import '../../styles/widgets/gradient_icon_widget.dart';
import 'components/botton_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    this.loginResData,
  }) : super(key: key);
  final LoginResData? loginResData;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreent = const StockPage();
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
              backgroundColor: AppColors.darkerBackground,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return BottonSheet(
                    loginResData: widget.loginResData.toString());
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: AppColors.black,
        child: SizedBox(
          height: 65,
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
                        currentScreent = const StockPage();
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
                            ? const GradientText('Cổ phiếu',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'Cổ phiếu',
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
                        currentScreent = ProfilePage(
                          dataProfile: widget.loginResData,
                        );
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 1
                            ? const GradientIcon(Icons.supervised_user_circle,
                                30, AppColors.gradienIcon)
                            : const Icon(
                                Icons.supervised_user_circle,
                                color: AppColors.grey,
                              ),
                        currentTab == 1
                            ? const GradientText('User',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'User',
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
                        currentScreent = WalletPage(
                          dataProfile: widget.loginResData,
                        );
                        CryptoRepository().getAssets();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 2
                            ? const GradientIcon(Icons.account_balance_wallet,
                                30, AppColors.gradienIcon)
                            : const Icon(
                                Icons.account_balance_wallet,
                                color: AppColors.grey,
                              ),
                        currentTab == 2
                            ? const GradientText('Ví',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'Ví',
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
                        currentScreent = const SettingPage();
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
                            ? const GradientText('Cài đặt',
                                gradient: AppColors.gradienIcon)
                            : const Text(
                                'Cài đặt',
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
