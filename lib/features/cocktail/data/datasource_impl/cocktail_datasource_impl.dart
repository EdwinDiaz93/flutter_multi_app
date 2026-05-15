import 'package:multi_app/features/cocktail/data/clients/api_client.dart';
import 'package:multi_app/features/cocktail/data/model/cocktail_category.dart';

import 'package:multi_app/features/cocktail/domain/datasource/cocktail_datasource.dart';
import 'package:multi_app/features/cocktail/domain/entities/category.dart';

class CocktailDatasourceImpl extends CocktailDatasource {
  @override
  Future<List<Category>> getCategories() async {
    final response = await ApiClient.cocktailApi.get('');

    final categoriesResponse = CocktailCategoriesResponse.fromJson(
      response.data,
    );

    return categoriesResponse.categories
        .map((cateogry) => CocktailCategory.toEntity(cateogry))
        .toList();
  }
}
