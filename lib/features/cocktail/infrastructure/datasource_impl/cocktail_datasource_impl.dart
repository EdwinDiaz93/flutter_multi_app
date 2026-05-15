import 'package:multi_app/features/cocktail/infrastructure/clients/api_client.dart';
import 'package:multi_app/features/cocktail/infrastructure/model/cocktail_category.dart';

import 'package:multi_app/features/cocktail/domain/datasource/cocktail_datasource.dart';
import 'package:multi_app/features/cocktail/domain/entities/category.dart';

class CocktailDatasourceImpl extends CocktailDatasource {
  @override
  Future<List<Category>> getCategories() async {
    final response = await ApiClient.cocktailApi.get('/list.php?c=list');

    final categoriesResponse = CocktailCategoriesResponse.fromJson(
      response.data,
    );

    return categoriesResponse.categories
        .map((cateogry) => cateogry.toEntity())
        .toList();
  }
}
