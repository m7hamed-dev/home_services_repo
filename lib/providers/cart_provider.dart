import 'package:flutter/material.dart';
import 'package:home_services/models/our_services_model.dart';

class CartProvprider extends ChangeNotifier {
  //
  List<OurServicesModel> cartItems = [];
  //
  double price = 0.0;
  double totalPrice = 0.0;
  //
  void addServiseToCart(OurServicesModel servicesModel) {
    if (cartItems.contains(servicesModel)) {
      return;
    }
    cartItems.add(servicesModel);
    notifyListeners();
  }

  void addQtyService(OurServicesModel servicesModel) {
    servicesModel.qty ??= 1;
    servicesModel.qty = servicesModel.qty! + 1;
    totalPrice = servicesModel.price * servicesModel.qty!;
    notifyListeners();
  }

  void removeItemFromCart(OurServicesModel servicesModel) {
    if (cartItems.isNotEmpty) {
      cartItems.remove(servicesModel);
      totalPrice = totalPrice - servicesModel.price;
      notifyListeners();
    }
  }
}
