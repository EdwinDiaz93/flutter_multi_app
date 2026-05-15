part of 'cocktail_category_bloc.dart';

sealed class CocktailCategoryState extends Equatable {
  const CocktailCategoryState();

  @override
  List<Object> get props => [];
}

final class CocktailCategoryInitial extends CocktailCategoryState {}

final class CocktailCategoryLoading extends CocktailCategoryState {}

final class CocktailCategoryLoaded extends CocktailCategoryState {
  final List<Category> categories;

  const CocktailCategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CocktailCategoryError extends CocktailCategoryState {
  final String message;

  const CocktailCategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
