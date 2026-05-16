import 'package:multi_app/features/cocktail/domain/entities/entities.dart';

abstract class CocktailDatasource {
  Future<List<Category>> getCategories();
  Future<List<Drink>> getDrinks(String category);
}
