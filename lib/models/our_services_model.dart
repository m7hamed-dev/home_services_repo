import 'package:flutter/material.dart';

class OurServicesModel {
  //
  final String jobTitle;
  final String imgUrl;
  final double price;
  final Color color;
  int? qty;

  OurServicesModel({
    required this.jobTitle,
    required this.imgUrl,
    required this.price,
    required this.color,
    this.qty = 1,
  });
}
