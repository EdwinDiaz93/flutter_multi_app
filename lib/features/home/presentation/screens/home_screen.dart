import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_app/config/constants/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi App")),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(menu[index].label),
          subtitle: Text(menu[index].label),
          leading: Icon(menu[index].icon),
          trailing: Icon(Icons.arrow_circle_right_outlined, size: 32),
          onTap: () => context.push(menu[index].route),
        ),
      ),
    );
  }
}
