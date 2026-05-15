import 'package:multi_app/features/cocktail/domain/datasource/cocktail_datasource.dart';
import 'package:multi_app/features/cocktail/domain/entities/category.dart';
import 'package:multi_app/features/cocktail/domain/repository/cocktail_repository.dart';

class CocktailRepositoryImpl extends CocktailRepository {
  final CocktailDatasource cocktailDatasource;

  CocktailRepositoryImpl({required this.cocktailDatasource});

  @override
  Future<List<Category>> getCategories() {
    return cocktailDatasource.getCategories();
  }
}
