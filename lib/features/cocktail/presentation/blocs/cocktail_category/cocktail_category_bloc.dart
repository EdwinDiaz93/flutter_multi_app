import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_app/features/cocktail/domain/entities/category.dart';
import 'package:multi_app/features/cocktail/domain/usecases/get_categories_usecase.dart';

part 'cocktail_category_event.dart';
part 'cocktail_category_state.dart';

class CocktailCategoryBloc
    extends Bloc<CocktailCategoryEvent, CocktailCategoryState> {
  final GetCategoriesUsecase getCategoriesUsecase;

  CocktailCategoryBloc({required this.getCategoriesUsecase})
    : super(CocktailCategoryInitial()) {
    on<LoadCategories>(_loadCategories);
  }

  Future<void> _loadCategories(
    LoadCategories evemt,
    Emitter<CocktailCategoryState> emit,
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
