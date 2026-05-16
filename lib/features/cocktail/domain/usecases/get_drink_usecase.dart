import 'package:multi_app/features/cocktail/domain/entities/drink.dart';
import 'package:multi_app/features/cocktail/domain/repository/cocktail_repository.dart';

class GetDrinkUsecase {
  final CocktailRepository cocktailRepository;

  GetDrinkUsecase({required this.cocktailRepository});

  Future<DrinkDetail> call(String id) async {
    return cocktailRepository.getDrink(id);
  }
}
