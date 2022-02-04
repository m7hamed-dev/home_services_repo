import 'package:flutter/material.dart';
import 'package:home_services/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  //
  CategoryProvider() {
    getCategories();
  }
  bool isLoading = true;
  List<CategoryModel> categories = [];
  //
  void getCategories() async {
    categories = [
      CategoryModel(
        id: '123',
        name: 'cleanin',
        imgUrl: 'barber',
      ),
      CategoryModel(
        id: '123',
        name: 'cleaining home',
        imgUrl: 'clothes-in-laundry',
      ),
      CategoryModel(
        id: '123',
        name: 'car-cleaning',
        imgUrl: 'medical-doctor',
      ),
      CategoryModel(
        id: '123',
        name: 'car-cleaning',
        imgUrl: 'washing-sink',
      ),
      CategoryModel(
        id: '123',
        name: 'car-cleaning',
        imgUrl: 'vacuum-cleaner',
      ),
      CategoryModel(
        id: '123',
        name: 'car-cleaning',
        imgUrl: 'vacuum-cleaner',
      ),
      CategoryModel(
        id: '123',
        name: 'car-cleaning',
        imgUrl: 'vacuum-cleaner',
      ),
      CategoryModel(
        id: '123',
        name: 'car-cleaning',
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
    // notifyListeners();
  }
}
