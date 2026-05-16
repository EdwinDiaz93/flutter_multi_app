import 'package:multi_app/features/cocktail/domain/entities/entities.dart';

abstract class CocktailRepository {
  Future<List<Category>> getCategories();
  Future<List<Drink>> getDrinks(String category);
  // Future<DrinkDetail> getDrink(String id);
}
