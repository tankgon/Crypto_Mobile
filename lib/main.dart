import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:movie_flutter/src/modules/home/home_page.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.none, statusBarBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        fontFamily: 'montserrat',
        // scaffoldBackgroundColor: const Color(0xff131e30),
        scaffoldBackgroundColor: AppColors.main,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: AppColors.white, displayColor: AppColors.white),
      ),
      home: const Home(),
    );
  }
}
