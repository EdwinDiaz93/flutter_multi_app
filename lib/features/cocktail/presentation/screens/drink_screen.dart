import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_app/config/dependency/dependency_injection.dart';
import 'package:multi_app/features/cocktail/domain/entities/drink.dart';
import 'package:multi_app/features/cocktail/presentation/blocs/cocktail/cocktail_bloc.dart';
import 'package:multi_app/widgets/cocktail/drink_header_image.dart';

class DrinkScreen extends StatelessWidget {
  final String drinkId;
  const DrinkScreen({super.key, required this.drinkId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CocktailBloc>()..add(LoadDrink(id: drinkId)),
      child: Scaffold(body: _DrinkDetailView(id: drinkId)),
    );
  }
}

class _DrinkDetailView extends StatelessWidget {
  final String id;

  const _DrinkDetailView({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<CocktailBloc, CocktailState>(
      builder: (context, state) {
        if (state is CocktailLoading) {
          return Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        if (state is CocktailDrinkLoaded) {
          final drink = state.drink;
          return SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DrinkHeaderImage(drink: drink),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      drink.name,
                      style: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  _DrinkInfoView(colors: colors, drink: drink),
                  Divider(color: colors.tertiary, thickness: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ingredients - Measures',
                      style: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: drink.ingredients.length,
                      itemBuilder: (context, index) => ListTile(
                        dense: true,
                        title: Text(
                          style: TextStyle(
                            color: colors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                          "${drink.ingredients[index]}  ${drink.measures.isNotEmpty ? drink.measures[index] : ''}",
                        ),
                      ),
                    ),
                  ),
                  Divider(color: colors.tertiary, thickness: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Instructions',

                          style: TextStyle(
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(drink.instructions['EN']!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is CocktailError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.message),
                FilledButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("Regresar"),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}

class _DrinkInfoView extends StatelessWidget {
  const _DrinkInfoView({super.key, required this.colors, required this.drink});

  final ColorScheme colors;
  final DrinkDetail drink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(12),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Tags'),
                Text(
                  drink.tag.isEmpty ? 'No tags for this drink' : drink.tag,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Category"),
                Text(
                  drink.category.isEmpty
                      ? 'No Category for this drink'
                      : drink.category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('IBA'),
                Text(
                  drink.type.isEmpty ? 'No IBA for this drink' : drink.type,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
