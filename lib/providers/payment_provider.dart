import 'package:flutter/material.dart';
import 'package:home_services/models/payment_model.dart';

class PaymentProvider extends ChangeNotifier {
  final List<PaymentModel> paymentMethods = <PaymentModel>[
    PaymentModel(
      name: 'Credit Card',
      imgUrl: 'card',
      color: Colors.blue.shade100,
    ),
    PaymentModel(
      name: 'Google Pay',
      imgUrl: 'google',
      color: Colors.red.shade100,
    ),
    PaymentModel(
      name: 'Cash on Delivery',
      imgUrl: 'bribery',
      color: Colors.amber.shade100,
    ),
    PaymentModel(
      name: 'Visa Card',
      imgUrl: 'visa',
      color: Colors.blue.shade100,
    ),
  ];
  int currentIndex = 0;
  //
  void setIndex(int selectIndex) {
    currentIndex = selectIndex;
    notifyListeners();
  }
}
