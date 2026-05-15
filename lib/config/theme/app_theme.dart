import 'package:flutter/material.dart';

const List<Color> colors = [Colors.deepPurple];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0});
  ThemeData getTheme() {
    return ThemeData(colorSchemeSeed: colors[selectedColor]);
  }
}
