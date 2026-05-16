import 'package:multi_app/features/cocktail/domain/entities/drink.dart';
import 'package:multi_app/features/cocktail/domain/repository/cocktail_repository.dart';

class GetDrinksUsecase {
  final CocktailRepository cocktailRepository;

  GetDrinksUsecase({required this.cocktailRepository});

  Future<List<Drink>> call(String category) async {
    return cocktailRepository.getDrinks(category);
  }
}
