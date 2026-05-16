import 'package:multi_app/features/cocktail/infrastructure/clients/api_client.dart';

import 'package:multi_app/features/cocktail/infrastructure/model/models.dart';

import 'package:multi_app/features/cocktail/domain/datasource/cocktail_datasource.dart';
import 'package:multi_app/features/cocktail/domain/entities/entities.dart';

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

  @override
  Future<List<Drink>> getDrinks(String category) async {
    final response = await ApiClient.cocktailApi.get('/filter.php?c=$category');

    final drinkList = CocktailDrinksResponse.fromJson(response.data);

    return drinkList.drinks.map((drink) => drink.toEntityDrink()).toList();
  }

  @override
  Future<DrinkDetail> getDrink(String id) async {
    final response = await ApiClient.cocktailApi.get('/lookup.php?i=$id');
    final drink = CocktailDrinksResponse.fromJson(response.data);
    return drink.drinks.map((e) => e.toEntityDrinkDetail()).toList().first;
  }
}
