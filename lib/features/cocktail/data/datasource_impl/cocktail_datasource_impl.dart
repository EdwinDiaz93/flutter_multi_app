import 'package:multi_app/features/cocktail/domain/datasource/cocktail_datasource.dart';
import 'package:multi_app/features/cocktail/domain/entities/category.dart';

class CocktailDatasourceImpl extends CocktailDatasource {
  @override
  Future<List<Category>> getCategories() {
    throw UnimplementedError();
  }
}
