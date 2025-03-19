import 'package:flutter/material.dart';

abstract class AppResponsive {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  static double height(double number) => (number / 852) * screenHeight;

  static double width(double number) => (number / 393) * screenWidth;
}
