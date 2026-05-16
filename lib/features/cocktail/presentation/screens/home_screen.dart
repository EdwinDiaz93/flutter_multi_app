import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_app/config/dependency/dependency_injection.dart';
import 'package:multi_app/features/cocktail/presentation/blocs/cocktai/cocktail_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drinks Type")),
      body: BlocProvider(
        create: (_) => getIt<CocktailBloc>()..add(LoadCategories()),
        child: _CategoryListView(),
      ),
    );
  }
}

class _CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<CocktailBloc, CocktailState>(
      builder: (context, state) {
        if (state is CocktailCategoryLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator(strokeWidth: 5)),
            ],
          );
        }

        if (state is CocktailCategoryLoaded) {
          return ListView.builder(
            itemCount: state.categories.length,
            itemBuilder: (context, index) => ListTile(
              trailing: Icon(Icons.arrow_circle_right_outlined, size: 32),
              title: Text(state.categories[index].name),
              onTap: () {
                print("Fuckyou");
              },
              leading: Icon(Icons.coffee),
            ),
          );
        }

        if (state is CocktailCategoryError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: 32, color: colors.primary),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
