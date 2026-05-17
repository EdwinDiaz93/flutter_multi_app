import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_app/config/dependency/dependency_injection.dart';
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
    print(id);
    return BlocBuilder<CocktailBloc, CocktailState>(
      builder: (context, state) {
        if (state is CocktailLoading) {
          return Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        if (state is CocktailDrinkLoaded) {
          return SafeArea(
            child: Column(children: [DrinkHeaderImage(drink: state.drink)]),
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
