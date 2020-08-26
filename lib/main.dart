import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
import './test_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = TEST_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      this._filters = filterData;
      this._availableMeals = TEST_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['glutenFree']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactoseFree']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        if (!meal.isVegan && _filters['vegan']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
//      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryScreen.routeName: (context) =>
            CategoryScreen(this._availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(
              this._filters,
              this._setFilters,
            ),
      },
//      dynamic changing route
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
//      default 404 route
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
