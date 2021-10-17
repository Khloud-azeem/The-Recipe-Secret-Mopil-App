import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../data.dart';

class MealRecipe extends StatefulWidget {
  static const routeName = '/meal-recipe';

  @override
  State<MealRecipe> createState() => _MealRecipeState();
}

class _MealRecipeState extends State<MealRecipe> {
  Widget buildSectionTitle(BuildContext context, String title) {
    //builder
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildListView(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.75,
      child: child,
    );
  }

  void removeItem(String mealId) {}

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'] as String;
    final selectedMeal = MealsDetails.firstWhere(
      (meal) => meal.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('The Recipe Secert'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MealItem(
              id: selectedMeal.id,
              imgUrl: selectedMeal.imageUrl,
              title: selectedMeal.title,
              duration: selectedMeal.duration,
              complexity: selectedMeal.complexity,
              affordability: selectedMeal.affordability,
              // removeItem: () => removeItem(mealId),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildListView(
              context,
              ListView.builder(
                itemBuilder: (context, idx) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(selectedMeal.ingredients[idx]),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildListView(
              context,
              ListView.builder(
                itemBuilder: (context, idx) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('#${idx + 1}'),
                    ),
                    title: Text(selectedMeal.steps[idx]),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () {
      //     Navigator.of(context).pop(mealId);
      //   },
      // ),
    );
  }
}
