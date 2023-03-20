import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';

import '../signin/signin_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(const SignInPage());
    });
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width / 1.7,
              height: size.height / 12,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/logo_main.png'),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 25.0,
            //   width: 25.0,
            //   child: CircularProgressIndicator(
            //     valueColor: AlwaysStoppedAnimation<Color>(
            //         Color.fromARGB(255, 153, 160, 255)),
            //     strokeWidth: 4.0,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
