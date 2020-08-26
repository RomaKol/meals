import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

import '../test_data.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';
  final List<Meal> availableMeals;

  CategoryScreen(this.availableMeals);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!this._loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String categoryId = routeArgs['id'];
      this.categoryTitle = routeArgs['title'];
      this.displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      this._loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      this.displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: this.displayedMeals[index].id,
            title: this.displayedMeals[index].title,
            imageUrl: this.displayedMeals[index].imageUrl,
            duration: this.displayedMeals[index].duration,
            complexity: this.displayedMeals[index].complexity,
            affordability: this.displayedMeals[index].affordability,
            removeItem: this._removeMeal,
          );
        },
        itemCount: this.displayedMeals.length,
      ),
    );
  }
}
