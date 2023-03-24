// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

import '../../config/api/user_repository.dart';
import '../../styles/themes/app_colors.dart';
import '../../styles/themes/app_text_styles.dart';
import '../../styles/widgets/gradien_text_widget.dart';
import '../../styles/widgets/gradient_button_widget.dart';
import '../../styles/widgets/gradient_icon_widget.dart';
import '../../styles/widgets/input_string_widget.dart';
import '../../styles/widgets/arrow_back_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DateTime? date;

  final username = TextEditingController();
  final fullName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final identificationNumber = TextEditingController();
  final address = TextEditingController();

  String getTextDate() {
    if (date == null) {
      return 'Vui lòng chọn ngày sinh';
    } else {
      return '${date?.year}-${date?.month}-${date?.day}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: size.width,
          height: size.height * 1.1,
          // color: AppColors.green,
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Center(
            //   child: Container(
            //     width: size.width / 2,
            //     height: size.height / 14,
            //     margin: const EdgeInsets.symmetric(vertical: 30),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(14),
            //       image: const DecorationImage(
            //         fit: BoxFit.cover,
            //         image: AssetImage('images/logo_main.png'),
            //       ),
            //     ),
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ArrowBack(),
            ),
            const GradientText(
              'Đăng ký tài khoản',
              gradient: AppColors.gradienIcon,
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: 30),
            InputToken(label: 'Tên sử dụng', controller: username, obscureText: false),
            InputToken(label: 'Họ và tên', controller: fullName, obscureText: false),
            InputToken(label: 'Mật khẩu', controller: password, obscureText: true),
            InputToken(label: 'Số điện thoại', controller: phoneNumber, obscureText: false),
            InputToken(label: 'Địa chỉ', controller: address, obscureText: false),
            InputToken(
              label: 'Chứng minh nhân dân',
              controller: identificationNumber,
               obscureText: false
            ),
            GestureDetector(
              onTap: (() => pickDate(context)),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey)),
                child: Row(
                  children: [
                    const GradientIcon(
                        Icons.date_range, 30, AppColors.gradienIcon),
                    const Text(
                      'Ngày sinh: ',
                      style: AppTextStyles.h1CG,
                    ),
                    Text(
                      getTextDate(),
                      // style: AppTextStyles.h1,
                    ),
                  ],
                ),
              ),
            ),
            GradientButton(
              name: 'Đăng ký',
              even: () {
                UserRepository().postRegister(
                  username.text,
                  password.text,
                  fullName.text,
                  address.text,
                  phoneNumber.text,
                  identificationNumber.text,
                  getTextDate(),
                );
                // Get.to(() => const HomePage());
              },
            ),
          ]),
        )),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initDate,
      firstDate: DateTime(DateTime.now().year - 25),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) return;
    setState(() => date = newDate);
  }
}
