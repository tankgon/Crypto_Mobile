import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/themes/app_colors.dart';
import '../signin/signin_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const SignInPage());
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const SignInPage()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 153, 160, 255)),
                strokeWidth: 4.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
