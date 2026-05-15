import 'package:multi_app/features/cocktail/domain/entities/category.dart';

abstract class CocktailDatasource {
  Future<List<Category>> getCategories();
}
