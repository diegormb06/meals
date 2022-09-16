import 'package:refeicoes/domain/enums/complexity.dart';
import '../enums/cost.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Cost cost;
  final Complexity complexity;

  const Meal({
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.cost,
    required this.complexity,
  });
}
