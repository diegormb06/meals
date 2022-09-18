import 'package:flutter/material.dart';
import 'package:refeicoes/presentation/components/data_display/Menu_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const DrawerMenuItem(icon: Icons.restaurant, label: 'Refeições'),
          const DrawerMenuItem(icon: Icons.settings, label: 'Configurações')
        ],
      ),
    );
  }
}
