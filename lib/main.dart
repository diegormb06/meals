import 'dart:io';

import 'package:flutter/material.dart';
import 'package:refeicoes/presentation/screens/categories_meals_screen.dart';
import 'package:refeicoes/presentation/screens/categories_screen.dart';
import 'package:refeicoes/presentation/screens/meal_detail_screen.dart';
import 'package:refeicoes/presentation/screens/tabs_screen.dart';
import 'package:refeicoes/routes.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: (context) => const MealDetailScreen()
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
