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

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Média';
      case Complexity.difficult:
        return 'Dificil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Médio';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecida';
    }
  }
}
