part of 'cocktail_bloc.dart';

sealed class CocktailState extends Equatable {
  const CocktailState();

  @override
  List<Object> get props => [];
}

final class CocktailInitial extends CocktailState {}

final class CocktailLoading extends CocktailState {}

final class CocktailCategoryLoaded extends CocktailState {
  final List<Category> categories;

  const CocktailCategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CocktailDrinksLoaded extends CocktailState {
  final List<Drink> drinks;

  const CocktailDrinksLoaded({required this.drinks});

  @override
  List<Object> get props => [drinks];
}

final class CocktailError extends CocktailState {
  final String message;

  const CocktailError({required this.message});

  @override
  List<Object> get props => [message];
}
