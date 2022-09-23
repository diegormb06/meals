import 'package:flutter/material.dart';
import 'package:refeicoes/domain/entities/meals_entity.dart';
import 'package:refeicoes/presentation/components/layout/main_drawer.dart';
import 'package:refeicoes/presentation/screens/categories_screen.dart';
import 'package:refeicoes/presentation/screens/favorite_meals_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Widget>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': const Text("Categorias"),
        'screen': const CategoriesScreen(),
      },
      {
        'title': const Text("Favoritos"),
        'screen': FavoriteMealsScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_selectedScreenIndex]['title'],
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
