part of 'cocktail_bloc.dart';

sealed class CocktailState extends Equatable {
  const CocktailState();

  @override
  List<Object> get props => [];
}

final class CocktailCategoryInitial extends CocktailState {}

final class CocktailCategoryLoading extends CocktailState {}

final class CocktailCategoryLoaded extends CocktailState {
  final List<Category> categories;

  const CocktailCategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CocktailCategoryError extends CocktailState {
  final String message;

  const CocktailCategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
