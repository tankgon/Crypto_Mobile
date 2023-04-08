import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

import '../signin/signin_page.dart';
import '../stock/components/background_widget.dart';
import 'components/item_setting.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Stack(children: [
      BackGroundWidget(size: size),
      Container(
        height: size.height,
        decoration: AppColors.gradientMain,
      ),
      Align(
        child: SizedBox(
          width: size.width / 1.2,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Settings',
                  style: AppTextStyles.h2W,
                ),
              ),
              ItemSetting(
                size: size,
                name: 'Account',
                icon: Icons.account_circle_rounded,
              ),
              ItemSetting(
                size: size,
                name: 'Share My Public Address',
                icon: Icons.location_on_outlined,
              ),
              ItemSetting(
                size: size,
                name: 'View on Etherscan',
                icon: Icons.remove_red_eye_outlined,
              ),
              ItemSetting(
                size: size,
                name: 'Preferences',
                icon: Icons.settings_suggest_outlined,
              ),
              ItemSetting(
                size: size,
                name: 'Get Help',
                icon: Icons.headphones_outlined,
              ),
              ItemSetting(
                size: size,
                name: 'Send Feed back',
                icon: Icons.send,
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: (() {
            // RestartWidget.restartApp(context);
            Get.offAll(() => const SignInPage());
            // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
          }),
          child: Container(
            padding: const EdgeInsets.only(bottom: 40),
            width: size.width / 1.2,
            child: ItemSetting(
              size: size,
              name: 'Logout',
              icon: Icons.logout,
            ),
          ),
        ),
      )
    ]));
  }
}
