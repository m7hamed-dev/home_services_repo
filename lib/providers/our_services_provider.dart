import 'package:flutter/material.dart';
import 'package:home_services/models/our_services_model.dart';

class OurServicesProvprider extends ChangeNotifier {
  //
  OurServicesProvprider() {
    getCategories();
  }
  bool isLoading = true;
  List<OurServicesModel> serviceManagers = [];
  List<OurServicesModel> filterServiceManagers = [];

  // voprice onFiltter(String catprice) {
  //   debugPrint('onFiltter');
  //   if (catprice.isNotEmpty) {
  //     filterServiceManagers = serviceManagers.where((person) {
  //       if (person.jobTitle.contains('c')) {
  //         debugPrint('statement');
  //         return true;
  //       }
  //       return false;
  //     }).toList();
  //     notifyListeners();
  //   } else {
  //     filterServiceManagers = serviceManagers;
  //     notifyListeners();
  //   }
  // }

  //
  void getCategories() async {
    filterServiceManagers = [
      OurServicesModel(
        price: 123.3,
        jobTitle: 'cleanin',
        imgUrl: 'barber',
        color: Colors.amber.shade100,
      ),
      OurServicesModel(
        price: 123.3,
        jobTitle: 'cleaining home',
        imgUrl: 'clothes-in-laundry',
        color: Colors.blue.shade100,
      ),
      OurServicesModel(
        price: 123.3,
        jobTitle: 'car-cleaning',
        imgUrl: 'medical-doctor',
        color: Colors.yellow.shade100,
      ),
      OurServicesModel(
        price: 123.3,
        jobTitle: 'car-cleaning',
        imgUrl: 'washing-sink',
        color: Colors.green.shade100,
      ),
      OurServicesModel(
        price: 123.3,
        jobTitle: 'car-cleaning',
        imgUrl: 'vacuum-cleaner',
        color: Colors.pink.shade100,
      ),
      OurServicesModel(
        price: 123.3,
        jobTitle: 'car-cleaning',
        imgUrl: 'vacuum-cleaner',
        color: Colors.pink.shade100,
      ),
      OurServicesModel(
        price: 123.3,
        jobTitle: 'car-cleaning',
        imgUrl: 'vacuum-cleaner',
        color: Colors.pink.shade100,
      ),
      OurServicesModel(
        price: 123.3,
        jobTitle: 'car-cleaning',
        color: Colors.pink.shade100,
        imgUrl: 'saw',
      ),
    ];
    await Future.delayed(const Duration(milliseconds: 200));
    isLoading = false;
    notifyListeners();
  }

  int currentIndex = 0;
  //
  void setIndex(int selectIndex) {
    currentIndex = selectIndex;
    notifyListeners();
  } //

  void removeServiceFromList(OurServicesModel ourServicesModel) {
    filterServiceManagers.remove(ourServicesModel);
    notifyListeners();
  }
}
