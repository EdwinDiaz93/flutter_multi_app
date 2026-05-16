import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_app/config/dependency/dependency_injection.dart';
import 'package:multi_app/features/cocktail/presentation/blocs/cocktai/cocktail_bloc.dart';
import 'package:multi_app/widgets/widgets.dart';

class DrinklistScreen extends StatelessWidget {
  final String category;
  const DrinklistScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drink List")),
      body: BlocProvider(
        create: (context) =>
            getIt<CocktailBloc>()..add(LoadDrinks(category: category)),
        child: _DrinkListView(),
      ),
    );
  }
}

class _DrinkListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(
      builder: (context, state) {
        if (state is CocktailLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CircularProgressIndicator(strokeWidth: 3)],
            ),
          );
        }

        if (state is CocktailDrinksLoaded) {
          return GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: state.drinks
                .map((drink) => DrinkCard(drink: drink))
                .toList(),
          );
        }
        if (state is CocktailError) {
          return Center(child: Text(state.message));
        }
        return SizedBox();
      },
    );
  }
}
