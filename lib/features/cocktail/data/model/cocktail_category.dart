import 'package:multi_app/features/cocktail/domain/entities/category.dart';

class CocktailCategoriesResponse {
  final List<CocktailCategory> categories;

  CocktailCategoriesResponse({required this.categories});

  factory CocktailCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CocktailCategoriesResponse(
        categories: List<CocktailCategory>.from(
          json["drinks"].map((x) => CocktailCategory.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class CocktailCategory {
  final String strCategory;

  CocktailCategory({required this.strCategory});

  factory CocktailCategory.fromJson(Map<String, dynamic> json) =>
      CocktailCategory(strCategory: json["strCategory"]);

  Map<String, dynamic> toJson() => {"strCategory": strCategory};

  static Category toEntity(CocktailCategory cocktailCategory) {
    return Category(name: cocktailCategory.strCategory);
  }
}
