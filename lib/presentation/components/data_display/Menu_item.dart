import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onTap;

  const DrawerMenuItem(this.icon, this.label, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
