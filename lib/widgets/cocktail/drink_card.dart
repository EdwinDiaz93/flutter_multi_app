import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_app/features/cocktail/domain/entities/entities.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;
  const DrinkCard({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        context.push('/cocktail-categories/drink/${drink.id}');
      },
      child: Card(
        elevation: 2,

        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(drink.image, fit: BoxFit.cover),
                ),
              ),
            ),
            Text(
              drink.name,
              style: TextStyle(
                color: colors.primary,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
