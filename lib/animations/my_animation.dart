import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MyAnimation extends StatelessWidget {
  const MyAnimation({
    Key? key,
    required this.child,
    this.length,
  }) : super(key: key);
  //
  final Widget child;
  final int? length;
  //
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: child,
      duration: Duration(milliseconds: length != null ? (length! * 300) : 100),
      // delay: Duration(milliseconds: length != null ? (length! * 300) : 100),
    );
  }
}
