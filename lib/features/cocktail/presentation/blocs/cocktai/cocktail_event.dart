part of 'cocktail_bloc.dart';

class CocktailEvent extends Equatable {
  const CocktailEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CocktailEvent {}

class LoadDrinks extends CocktailEvent {
  final String category;

  const LoadDrinks({required this.category});
}
