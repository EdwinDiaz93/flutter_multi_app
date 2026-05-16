import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_app/features/cocktail/domain/entities/category.dart';
import 'package:multi_app/features/cocktail/domain/entities/drink.dart';
import 'package:multi_app/features/cocktail/domain/usecases/get_categories_usecase.dart';
import 'package:multi_app/features/cocktail/domain/usecases/get_drink_usecase.dart';
import 'package:multi_app/features/cocktail/domain/usecases/get_drinks_usecase.dart';

part 'cocktail_event.dart';
part 'cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  final GetCategoriesUsecase getCategoriesUsecase;
  final GetDrinksUsecase getDrinksUsecase;
  final GetDrinkUsecase getDrinkUsecase;

  CocktailBloc({
    required this.getCategoriesUsecase,
    required this.getDrinksUsecase,
    required this.getDrinkUsecase,
  }) : super(CocktailInitial()) {
    on<LoadCategories>(_loadCategories);
    on<LoadDrinks>(_loadDrinks);
    on<loadDrink>(_loadDrinkDetail);
  }

  Future<void> _loadCategories(
    LoadCategories evemt,
    Emitter<CocktailState> emit,
  ) async {
    emit(CocktailLoading());

    try {
      final categories = await getCategoriesUsecase();

      emit(CocktailCategoryLoaded(categories: categories));
    } catch (e) {
      emit(CocktailError(message: 'Error cargando categorias'));
    }
  }

  Future<void> _loadDrinks(
    LoadDrinks event,
    Emitter<CocktailState> emit,
  ) async {
    emit(CocktailLoading());
    try {
      final drinks = await getDrinksUsecase(event.category);
      emit(CocktailDrinksLoaded(drinks: drinks));
    } catch (e) {
      emit(CocktailError(message: "error cargando bebidas"));
    }
  }

  Future<void> _loadDrinkDetail(
    loadDrink event,
    Emitter<CocktailState> emit,
  ) async {
    emit(CocktailInitial());
    try {
      final drink = await getDrinkUsecase(event.id);
      emit(CocktailDrinkLoaded(drink: drink));
    } catch (e) {
      emit(CocktailError(message: "error al cargar bebida"));
    }
  }
}
