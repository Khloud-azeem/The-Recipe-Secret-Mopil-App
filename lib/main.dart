import 'package:flutter/material.dart';
import 'screens/favourites_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_recipe_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealRecipe.routeName: (context) => MealRecipe(),
        FavouritesScreen.routeName: (context) => FavouritesScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      // onGenerateRoute: (setting) {
      //   return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      // },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (context) => CategoryMealsScreen(),
        );
      },
    );
  }
}
