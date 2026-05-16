import 'package:flutter/material.dart';

class DrinkScreen extends StatelessWidget {
  final String drinkId;
  const DrinkScreen({super.key, required this.drinkId});

  @override
  Widget build(BuildContext context) {
    return _DrinkDetailView(id: drinkId);
  }
}

class _DrinkDetailView extends StatelessWidget {
  final String id;

  const _DrinkDetailView({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Drink Detail $id")));
  }
}
