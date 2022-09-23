import 'package:flutter/material.dart';
import 'package:refeicoes/presentation/components/layout/meal_item.dart';

import '../../domain/entities/meals_entity.dart';

class FavoriteMealsScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteMealsScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(child: Text("Nenhuma refeição nos favoritos"));
    }

    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (BuildContext context, int index) {
        return MealItem(meal: favoriteMeals[index]);
      },
    );
  }
}
