import 'package:flutter/material.dart';

class ScreenUtils {
  //
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  //
  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  //
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 800.0;
  //
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width == 800.0;
}
