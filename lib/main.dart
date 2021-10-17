import 'package:flutter/material.dart';
import 'screens/favourites_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_recipe_screen.dart';
import 'screens/category_meals_screen.dart';
import 'models/filters.dart';
import 'models/meal.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters();

  List<Meal> _filteredMeals = MealsDetails;

  void _setFilters(Filters filters) {
    setState(() {
      _filters = filters;
      _filteredMeals = MealsDetails.where((meal) {
        if (filters.isGlutenFree && !meal.isGlutenFree) return false;
        if (filters.isLactoseFree && !meal.isLactoseFree) return false;
        if (filters.isVegiterian && !meal.isVegetarian) return false;
        if (filters.isVegan && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Recipes Secrets',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.grey.shade200,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.grey.shade900),
              bodyText2: TextStyle(color: Colors.grey.shade900),
              // title: DOESN'T WORK????
              headline1: const TextStyle(
                fontSize: 23,
                fontFamily: 'RocbotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      // initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_filteredMeals),
        MealRecipe.routeName: (context) => MealRecipe(),
        FavouritesScreen.routeName: (context) => FavouritesScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (setting) {
      //   return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      // },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (context) => CategoryMealsScreen(_filteredMeals),
        );
      },
    );
  }
}
