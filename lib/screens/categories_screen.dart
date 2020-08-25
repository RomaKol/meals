import 'package:flutter/material.dart';

import '../widgets/category_item.dart';

import '../test_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: TEST_CATEGORIES
          .map((category) => CategoryItem(
                category.id,
                category.title,
                category.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
