import 'package:flutter/material.dart';

import '../stock/components/background_widget.dart';
import 'components/item_setting.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Stack(children: [
      BackGroundWidget(size: size),
      Container(
        height: size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black87,
          Color(0xff131e30),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      ),
      Align(
        child: SizedBox(
          width: size.width / 1.2,
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ItemSetting(
                name: 'Account',
                icon: Icons.account_circle_rounded,
              ),
              ItemSetting(
                name: 'Share My Public Address',
                icon: Icons.location_on_outlined,
              ),
              ItemSetting(
                name: 'View on Etherscan',
                icon: Icons.remove_red_eye_outlined,
              ),
              ItemSetting(
                name: 'Preferences',
                icon: Icons.settings_suggest_outlined,
              ),
              ItemSetting(
                name: 'Get Help',
                icon: Icons.headphones_outlined,
              ),
              ItemSetting(
                name: 'Send Feed back',
                icon: Icons.send,
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(bottom: 40),
          width: size.width / 1.2,
          child: const ItemSetting(
            name: 'Logout',
            icon: Icons.logout,
          ),
        ),
      )
    ]));
  }
}
