import 'package:flutter/material.dart';

import '../../styles/themes/app_colors.dart';
import '../../styles/themes/app_text_styles.dart';
import '../../styles/widgets/gradien_text.dart';
import '../stock/components/background_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          BackGroundWidget(size: size),
          Container(
            height: size.height / 3,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black54,
              Colors.black,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          // const ArrowBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, top: size.height / 7),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: size.height / 2.5,
                        height: size.height / 4,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/3.png'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          width: size.width,
                          child: const Text(
                            'user_1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          width: size.width,
                          child: const GradientText('Thanh ne',
                              style: AppTextStyles.h2,
                              gradient: AppColors.gradienIcon),
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            width: size.width,
                            child: const Text(
                              'Tên: Nguyễn Phúc Thanh',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            width: size.width,
                            child: const Text(
                              'Sđt: 0703348869',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            width: size.width,
                            child: const Text(
                              'Địa chỉ: Nha Trang',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            width: size.width,
                            child: const Text(
                              'Ngày sinh: 25/04/2001',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )),
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: size.height - 120,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      width: size.width,
                      child: TabBar(
                        tabs: const [
                          Tab(text: 'Xác thực User'),
                          Tab(text: 'Săn thưởng')
                        ],
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        indicatorColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildTitle('Mã hóa Passphrase'),
                              const Padding(
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  'Nếu đã chọn được nơi lưu trữ phù hợp, anh em có thể ghi Passphrase vào đó. Nhưng nếu anh em vẫn nghi ngờ về độ bảo mật, có thể “gây nhiễu” Passphrase với cách này, cho dù người khác có thấy được Passphrase cũng không thể nào vào được. Nhưng nhược điểm là anh em cần nhớ “chìa khóa giải mã”, nếu không muốn tài sản của mình nằm yên như cách nhiều người cho BTC của họ “ngủ quên” nhiều năm. \n\nMột cách khác dành cho anh em thích ghi ra giấy, đó là ghi Passphrase ra nhiều mẫu giấy, sau đó đưa cho vài người khác giữ, hoặc cất két sắt. Cách này khá bảo mật, nhưng khá tốn công và đòi hỏi những người trên không hiểu gì về nội dung trên giấy.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              buildTitle('Sử dụng Email riêng'),

                              // CastBar(size: size),
                              buildTitle('Trailer and song'),
                              // const TrailerBar()
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text('Review Page'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }

  Padding buildTitle(String content) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GradientText(content,
          style: AppTextStyles.h2, gradient: AppColors.gradienIcon),
    );
  }
}
