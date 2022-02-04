import 'package:flutter/material.dart';

class AppTxt extends StatelessWidget {
  //
  const AppTxt(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
  }) : super(key: key);
  //
  final String data;
  final Color? color;
  final double? fontSize;
  //
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize ?? 15.0,
        color: color ?? Colors.black,
        fontFamily: 'ubuntu',
      ),
    );
  }
}
