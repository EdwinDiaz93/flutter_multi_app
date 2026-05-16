import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_app/config/dependency/dependency_injection.dart';
import 'package:multi_app/features/cocktail/presentation/blocs/cocktail/cocktail_bloc.dart';

class DrinkScreen extends StatelessWidget {
  final String drinkId;
  const DrinkScreen({super.key, required this.drinkId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CocktailBloc>()..add(loadDrink(id: drinkId)),
      child: Scaffold(
        appBar: AppBar(title: Text("Drink Details")),
        body: _DrinkDetailView(id: drinkId),
      ),
    );
  }
}

class _DrinkDetailView extends StatelessWidget {
  final String id;

  const _DrinkDetailView({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(
      builder: (context, state) {
        if (state is CocktailLoading) {
          return Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        if (state is CocktailDrinkLoaded) {
          return Center(child: Text(state.drink.name));
        }

        if (state is CocktailError) {
          return Center(child: Text(state.message));
        }
        return SizedBox();
      },
    );
  }
}
