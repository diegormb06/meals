import 'package:flutter/material.dart';
import 'package:refeicoes/data/meals_data.dart';
import 'package:refeicoes/presentation/components/meal_item.dart';
import '../../domain/entities/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = mealsData
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, idx) {
          return MealItem(meal:categoryMeals[idx]);
        },
      ),
    );
  }
}
