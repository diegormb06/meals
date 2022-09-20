import 'package:flutter/material.dart';
import 'package:refeicoes/domain/entities/meals_entity.dart';
import 'package:refeicoes/presentation/components/layout/meal_item.dart';
import '../../domain/entities/category_entity.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.meals, {super.key});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, idx) {
          return MealItem(meal: categoryMeals[idx]);
        },
      ),
    );
  }
}
