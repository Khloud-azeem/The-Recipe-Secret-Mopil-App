// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipes_secrests/widgets/category_item.dart';
import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: CategoriesGrid.map(
        (cg) => CategoryItem(
          id: cg.id,
          title: cg.title,
          color: cg.color,
        ),
      ).toList(),
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
