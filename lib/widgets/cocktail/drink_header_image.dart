import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_app/features/cocktail/domain/entities/drink.dart';
import 'package:multi_app/widgets/widgets.dart';

class DrinkHeaderImage extends StatelessWidget {
  final DrinkDetail drink;
  const DrinkHeaderImage({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      height: 250,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            drink.imageUrl,
            fit: BoxFit.cover,
            alignment: AlignmentGeometry.center,
          ),
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.black.withValues(alpha: 0.4),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GlassButton(
              onTap: () {
                context.pop();
              },
              child: Icon(Icons.arrow_back, size: 30, color: Colors.white),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GlassButton(
              onTap: () {},
              child: Icon(
                Icons.bookmark_border_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
