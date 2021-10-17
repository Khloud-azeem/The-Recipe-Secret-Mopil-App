import 'package:flutter/material.dart';
import '../screens/meal_recipe_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  MealItem({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    // required this.removeItem,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealRecipeScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
    // .then(
    //   (id) {
    //     if (id != null) {
    //       removeItem(id);
    //     }
    //   },
    // );
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Hard';
      default:
        return 'Challenging';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';
      case Affordability.pricey:
        return 'pricey';
      default:
        return 'luxurious';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  // the extra R stands for rounded
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 5,
                  child: Container(
                    width: 300,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(15),
                    // ) //doesn't work,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.watch),
                      const SizedBox(width: 5),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.construction_sharp),
                      const SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money_sharp),
                      const SizedBox(width: 5),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
