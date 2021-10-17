import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
// import '../categories_grid.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({
    required this.id,
    required this.title,
    required this.color,
  });

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id: id, title: title);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //gives ripple rffect, we could use GestureDetector()
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Center(
          child: FittedBox(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
