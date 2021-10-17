import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String id;
  // final String title;

  // CategoryMealsScreen({
  //   required this.id,
  //   required this.title,
  // });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'] as String;
    final categoryTitle = routeArgs['title'] as String;

    final categoryMeals = MealsDetails.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, idx) {
            return MealItem(
              id: categoryMeals[idx].id,
              imgUrl: categoryMeals[idx].imageUrl,
              title: categoryMeals[idx].title,
              duration: categoryMeals[idx].duration,
              complexity: categoryMeals[idx].complexity,
              affordability: categoryMeals[idx].affordability,
              // removeItem: categoryMeals[idx].,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
