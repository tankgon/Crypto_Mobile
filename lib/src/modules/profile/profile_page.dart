import 'package:flutter/material.dart';

import '../../models/platform.dart';
import '../../styles/themes/app_colors.dart';
import '../../styles/themes/app_text_styles.dart';
import '../../styles/widgets/gradien_text.dart';
import '../stock/components/background_widget.dart';
import 'components/Cast/cart_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

List<IProfile> profile = [
  IProfile('svgs/gg.svg', 'google'),
  IProfile('svgs/fb.svg', 'facebook'),
  IProfile('svgs/ig.svg', 'instagram'),
  IProfile('svgs/tw.svg', 'twitter'),
  IProfile('svgs/dc.svg', 'discord'),
  IProfile('svgs/zl.svg', 'zalo'),
  IProfile('svgs/gh.svg', 'github'),
  IProfile('svgs/tt.svg', 'tiktok'),
];

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
                            image: NetworkImage(
                                "https://source.unsplash.com/random/200x200?sig=incrementingIdentifier"),
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
                              'Địa chỉ: Vũng Tàu',
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
                                  'Nếu đã chọn được nơi lưu trữ phù hợp, bạn có thể ghi Passphrase vào đó. Nhưng nếu bạn vẫn nghi ngờ về độ bảo mật, có thể “gây nhiễu” Passphrase với cách này, cho dù người khác có thấy được Passphrase cũng không thể nào vào được. Nhưng nhược điểm là bạn cần nhớ “chìa khóa giải mã”, nếu không muốn tài sản của mình nằm yên như cách nhiều người cho BTC của họ “ngủ quên” nhiều năm. \n\nMột cách khác dành cho bạn thích ghi ra giấy, đó là ghi Passphrase ra nhiều mẫu giấy, sau đó đưa cho vài người khác giữ, hoặc cất két sắt. Cách này khá bảo mật, nhưng khá tốn công và đòi hỏi những người trên không hiểu gì về nội dung trên giấy.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              buildTitle('Xác thực tài khoản'),
                              CastBar(size: size),
                              buildTitle('Đăng nhập xác thực tại bản web'),
                              const Padding(
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  'https://csdl.vercel.app/',
                                  style: TextStyle(
                                      color: AppColors.blueMain, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width / 4.5,
                                height: size.width / 4.5,
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.only(left: 24),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('images/gift.png'))),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: size.height / 3),
                                padding: const EdgeInsets.only(left: 24),
                                child: const Text('hiện chưa có nhiệm vụ nào',
                                    style: AppTextStyles.h1C),
                              ),
                            ],
                          ),
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
