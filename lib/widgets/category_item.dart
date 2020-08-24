import 'package:flutter/material.dart';

import '../screens/category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
//      '/category',
      CategoryScreen.routeName,
      arguments: {
        'id': this.id,
        'title': this.title,
      },
    );
//      MaterialPageRoute(
//        builder: (_) {
//          return CategoryScreen(this.id, this.title);
//        },
//      ),
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.title,
        ),
//      color: this.color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
