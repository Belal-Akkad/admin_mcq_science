import 'package:flutter/material.dart';

abstract class AppColor {
  static const Color kTurquoiseColor = Color(0xFF12CACA);
  static const Color kWhiteColor = Color(0xFFFFFEFE);
  static const Color kRedColor = Color(0xFFE92E30);
  static const Color kGrayColor = Color(0xFFC1C1C1);
  static const Color kBlueGrayColor = Color(0xFF607D8B);
  static const Color kwhite10 = Colors.white10;
  static const Color kMidnightBlue = Color(0xFF252C4A);
  static const Color kBlackColor = Colors.black;
  static const LinearGradient kPrimaryGradient = LinearGradient(
    colors: [
      Color(0xFF46A0Ae),
      Color(0xFF00FFCB),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
