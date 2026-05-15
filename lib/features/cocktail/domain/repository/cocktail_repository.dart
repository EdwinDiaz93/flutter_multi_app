import 'package:multi_app/features/cocktail/domain/entities/category.dart';

abstract class CocktailRepository {
  Future<List<Category>> getCategories();
}
