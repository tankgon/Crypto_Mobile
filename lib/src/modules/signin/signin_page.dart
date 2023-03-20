import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/src/modules/signup/signup_page.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';
import 'package:movie_flutter/src/styles/themes/app_text_styles.dart';

import '../../styles/widgets/gradien_text.dart';
import '../../styles/widgets/gradient_button.dart';
import '../../styles/widgets/input_string.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: size.width,
          height: size.height / 1.1,
          // color: AppColors.green,
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Container(
                width: size.width / 2,
                height: size.height / 14,
                margin: const EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/logo_main.png'),
                  ),
                ),
              ),
            ),
            const GradientText(
              'Đăng nhập tài khoản',
              gradient: AppColors.gradienIcon,
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: 30),
            const InputToken(label: 'Email'),
            const InputToken(label: 'Password'),
            const GradientButton(name: 'Sign In'),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Không có tài khoản? '),
                    GestureDetector(
                        onTap: () {
                          Get.to(const SignUpPage());
                          // setState(() {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const SignUpPage()),
                          //   );
                          // });
                        },
                        child: const Text('Tạo ngay',
                            style: AppTextStyles.h1limit)),
                  ],
                ),
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
