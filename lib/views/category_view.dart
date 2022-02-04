import 'package:flutter/material.dart';
import 'package:home_services/animations/my_animation.dart';
import 'package:home_services/providers/category_provider.dart';
import 'package:home_services/widgets/card_category.dart';
import 'package:provider/src/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _categoryProvider = context.watch<CategoryProvider>();
    // for testing only ....
    _categoryProvider.getCategories();
    //
    if (_categoryProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 140.0,
      child: ListView.builder(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _categoryProvider.categories.length,
        itemBuilder: (context, index) {
          return MyAnimation(
            length: _categoryProvider.categories.length,
            child: CardCategory(
              categoryModel: _categoryProvider.categories[index],
              index: index,
            ),
          );
        },
      ),
    );
  }
}
