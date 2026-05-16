import 'package:multi_app/features/cocktail/domain/entities/entities.dart';
import 'package:multi_app/features/cocktail/domain/repository/cocktail_repository.dart';

class GetCategoriesUsecase {
  final CocktailRepository cocktailRepository;

  GetCategoriesUsecase({required this.cocktailRepository});

  Future<List<Category>> call() async {
    return cocktailRepository.getCategories();
  }
}
