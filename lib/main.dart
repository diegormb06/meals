import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:refeicoes/data/meals_data.dart';
import 'package:refeicoes/domain/entities/meals_entity.dart';
import 'package:refeicoes/domain/entities/settings_entity.dart';
import 'package:refeicoes/presentation/screens/categories_meals_screen.dart';
import 'package:refeicoes/presentation/screens/meal_detail_screen.dart';
import 'package:refeicoes/presentation/screens/settings_screen.dart';
import 'package:refeicoes/presentation/screens/tabs_screen.dart';
import 'package:refeicoes/routes.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = mealsData;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = mealsData.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    inspect(_availableMeals);
    inspect(settings);
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromARGB(255, 248, 190, 65),
          primary: Colors.pink, // Your accent color
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoriesMeals: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (context) => const MealDetailScreen(),
        AppRoutes.settings: (context) => SettingsScreen(_filterMeals, settings)
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
