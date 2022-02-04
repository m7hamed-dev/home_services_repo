import 'package:flutter/material.dart';
import 'package:home_services/models/service_mangers_model.dart';

class ServiceMangersProvider extends ChangeNotifier {
  //
  ServiceMangersProvider() {
    getCategories();
  }
  bool isLoading = true;
  List<ServiceManagersModel> serviceManagers = [];
  List<ServiceManagersModel> filterServiceManagers = [];

  void onFiltter(String catID) {
    debugPrint('onFiltter');
    if (catID.isNotEmpty) {
      filterServiceManagers = serviceManagers.where((person) {
        if (person.name.contains('c')) {
          debugPrint('statement');
          return true;
        }
        return false;
      }).toList();
      notifyListeners();
    } else {
      filterServiceManagers = serviceManagers;
      notifyListeners();
    }
  }

  //
  void getCategories() async {
    filterServiceManagers = [
      ServiceManagersModel(
        id: '123',
        name: 'mohamed',
        jobTitle: 'cleanin',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLe5PABjXc17cjIMOibECLM7ppDwMmiDg6Dw&usqp=CAU',
        rate: 5.0,
        status: false,
      ),
      ServiceManagersModel(
        id: '123',
        name: 'mohamed',
        jobTitle: 'cleanin',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU',
        rate: 4.0,
        status: true,
      ),
      ServiceManagersModel(
        id: '123',
        name: 'mohamed',
        jobTitle: 'cleanin',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIPDQwUMpolVfiXmHxCSWUEcDCO7RMSoKx5mKnEuRX2xyKLjhR-kCn2h0jb5oRn7EnCmk&usqp=CAU',
        rate: 3.5,
        status: true,
      ),
      ServiceManagersModel(
        id: '123',
        name: 'mohamed',
        jobTitle: 'cleanin',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUVYD3SuPHxkPYy0xw4SOsusjuJgPWdtIgxk12RiW_pNODJZgpqds0tPMSV9hteVLArg8&usqp=CAU',
        rate: 2.5,
        status: true,
      ),
      ServiceManagersModel(
        id: '123',
        name: 'mohamed',
        jobTitle: 'cleanin',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUVYD3SuPHxkPYy0xw4SOsusjuJgPWdtIgxk12RiW_pNODJZgpqds0tPMSV9hteVLArg8&usqp=CAU',
        rate: 2.0,
        status: true,
      ),
      ServiceManagersModel(
        id: '123',
        name: 'mohamed',
        jobTitle: 'cleanin',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUVYD3SuPHxkPYy0xw4SOsusjuJgPWdtIgxk12RiW_pNODJZgpqds0tPMSV9hteVLArg8&usqp=CAU',
        rate: 0.0,
        status: true,
      ),
      ServiceManagersModel(
        id: '123',
        name: 'mohamed',
        jobTitle: 'cleanin',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUVYD3SuPHxkPYy0xw4SOsusjuJgPWdtIgxk12RiW_pNODJZgpqds0tPMSV9hteVLArg8&usqp=CAU',
        rate: 1.5,
        status: true,
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
  }
}
