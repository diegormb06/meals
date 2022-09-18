import 'package:flutter/material.dart';
import 'package:refeicoes/data/categories_data.dart';
import 'package:refeicoes/presentation/components/layout/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: categories.map((cat) => CategoryItem(category: cat)).toList(),
    );
  }
}
