import 'package:flutter/material.dart';

class MenuItem {
  final String label;
  final String route;
  final IconData icon;

  MenuItem({required this.label, required this.route, required this.icon});
}

final List<MenuItem> menu = [
  MenuItem(
    label: "Cocktail Db",
    route: '/cocktail-categories',
    icon: Icons.wine_bar,
  ),
];
