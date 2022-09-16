import 'package:flutter/material.dart';

import '../../domain/entities/meals_entity.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredientes',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            width: 300,
            height: 200,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: ((context, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(meal.ingredients[index]),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
