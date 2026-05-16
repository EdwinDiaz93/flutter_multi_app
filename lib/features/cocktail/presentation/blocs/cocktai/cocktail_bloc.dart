import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_app/features/cocktail/domain/entities/category.dart';
import 'package:multi_app/features/cocktail/domain/usecases/get_categories_usecase.dart';

part 'cocktail_event.dart';
part 'cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  final GetCategoriesUsecase getCategoriesUsecase;

  CocktailBloc({required this.getCategoriesUsecase})
    : super(CocktailCategoryInitial()) {
    on<LoadCategories>(_loadCategories);
  }

  Future<void> _loadCategories(
    LoadCategories evemt,
    Emitter<CocktailState> emit,
  ) async {
    emit(CocktailCategoryLoading());

    try {
      final categories = await getCategoriesUsecase();

      emit(CocktailCategoryLoaded(categories: categories));
    } catch (e) {
      emit(CocktailCategoryError(message: 'Error cargando categorias'));
    }
  }
}
