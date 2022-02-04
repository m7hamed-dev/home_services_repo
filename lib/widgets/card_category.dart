import 'package:flutter/material.dart';
import 'package:home_services/models/category_model.dart';
import 'package:home_services/providers/category_provider.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/views/our_services_listview.dart';
import 'package:provider/src/provider.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    required this.categoryModel,
    required this.index,
  }) : super(key: key);
  //
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    final _categoryProvider = context.read<CategoryProvider>();
    return InkWell(
      onTap: () {
        _categoryProvider.setIndex(index);
        // await Future.delayed(const Duration(milliseconds: 600));
        Push.to(context, const OutServicesListView());
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          border: Border.all(
            color: _categoryProvider.currentIndex == index
                ? Colors.grey
                : Colors.white,
            width: _categoryProvider.currentIndex == index ? 0.8 : 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 2.0,
              blurRadius: 10.0,
              offset: const Offset(2.2, 2.2),
            )
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/${categoryModel.imgUrl}.png',
                height: 60.0,
                width: 80.0,
              ),
              Text(categoryModel.name),
            ],
          ),
        ),
      ),
    );
  }
}
