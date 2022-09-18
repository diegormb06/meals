import 'package:flutter/material.dart';

import '../../domain/entities/meals_entity.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _sectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _listContainer(Widget child) {
    return Container(
        width: 300,
        height: 200,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _sectionTitle(context, 'Ingredientes'),
            _listContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: ((context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                }),
              ),
            ),
            _sectionTitle(context, 'Passos'),
            _listContainer(ListView.builder(
              itemBuilder: (ctx, idx) {
                return Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(idx + 1)}'),
                    ),
                    title: Text(meal.steps[idx]),
                  ),
                  const Divider(),
                ]);
              },
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
