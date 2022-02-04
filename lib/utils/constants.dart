import 'package:flutter/material.dart';
import 'package:home_services/utils/screen_utils.dart';
import 'package:home_services/widgets/app_txt.dart';

class Constants {
  //
  static SliverGridDelegateWithFixedCrossAxisCount gridDelegateProperties(
          BuildContext context,
          {int? crossAxisCount}) =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            ScreenUtils.isDesktop(context) ? crossAxisCount ?? 3 : 2,
        // mainAxisSpacing: 5.0,
        // crossAxisSpacing: 5.0,
        // childAspectRatio: 2 / 1,
      );
  //
  static Widget? drawer(BuildContext context) => ScreenUtils.isDesktop(context)
      ? const Drawer(backgroundColor: Colors.black)
      : null;
  // footer
  static Widget footer(BuildContext context) {
    return Container(
      height: ScreenUtils.isDesktop(context) ? 200.0 : 0.0,
      color: Colors.red.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AppTxt(
            'CopyRight',
            fontSize: 30.0,
          ),
          AppTxt(
            'CopyRight',
            fontSize: 30.0,
          ),
          AppTxt(
            'CopyRight',
            fontSize: 30.0,
          ),
        ],
      ),
    );
  }
}
