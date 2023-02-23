import 'package:flutter/material.dart';

class AppColors {
  static const main = Color(0xff020210);
  static const none = Colors.transparent;

  static const lightBlue = Color(0xFF48CAE7);
  static const blueMain = Color(0xFF3D58F8);
  static const blueIllustration = Color(0xFF2C4BA1);
  static const darkBlueIllustration = Color(0xFF1E3577);
  static const grey = Color(0xFFABADBD);
  static const greyBackground = Color(0xFF42476A);
  static const darkGrey = Color(0xFF42476A);
  static const darkBackground = Color(0xFF151D3B);
  static const darkerBackground = Color(0xFF0B0F2F);

  static const orange = Colors.deepOrange;
  static const red = Colors.redAccent;
  static const green = Colors.greenAccent;
  static const yellow = Colors.yellowAccent;
  static const blue = Colors.blueAccent;
  static const white = Colors.white;
  static const white54 = Colors.white54;
  static const white70 = Colors.white70;
  static const white30 = Colors.white30;
  static const white10 = Colors.white10;
  static const black = Colors.black;

  static final gradienText = LinearGradient(colors: [
    Colors.blue.shade400,
    Colors.blue.shade100,
  ]);

  static const gradienIcon = LinearGradient(
    colors: <Color>[
      Color(0xff8AD4EC),
      Color(0xffEF96FF),
      Color(0xffFF56A9),
      Color(0xffFFAA6C),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientMain = BoxDecoration(
      gradient: LinearGradient(colors: [
    Colors.black87,
    Color(0xff131e30),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter));
}
