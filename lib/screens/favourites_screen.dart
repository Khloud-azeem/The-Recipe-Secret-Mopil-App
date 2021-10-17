import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  static const routeName = 'favourits';

  List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.favouriteMeals.isEmpty
            ? Center(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Text(
                    "You don't have any favourit meals, Add some!",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (context, idx) {
                    return MealItem(
                      id: widget.favouriteMeals[idx].id,
                      imgUrl: widget.favouriteMeals[idx].imageUrl,
                      title: widget.favouriteMeals[idx].title,
                      duration: widget.favouriteMeals[idx].duration,
                      complexity: widget.favouriteMeals[idx].complexity,
                      affordability: widget.favouriteMeals[idx].affordability,
                      // removeItem: categoryMeals[idx].,
                    );
                  },
                  itemCount: widget.favouriteMeals.length,
                ),
              )
      ],
    );
  }
}
