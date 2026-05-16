import 'package:multi_app/features/cocktail/domain/entities/entities.dart';

class CocktailDrinksResponse {
  final List<CocktailDrink> drinks;

  CocktailDrinksResponse({required this.drinks});

  factory CocktailDrinksResponse.fromJson(Map<String, dynamic> json) =>
      CocktailDrinksResponse(
        drinks: List<CocktailDrink>.from(
          json["drinks"].map((x) => CocktailDrink.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class CocktailDrink {
  final String strDrink;
  final String strDrinkThumb;
  final String idDrink;

  CocktailDrink({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  factory CocktailDrink.fromJson(Map<String, dynamic> json) => CocktailDrink(
    strDrink: json["strDrink"],
    strDrinkThumb: json["strDrinkThumb"],
    idDrink: json["idDrink"],
  );

  Map<String, dynamic> toJson() => {
    "strDrink": strDrink,
    "strDrinkThumb": strDrinkThumb,
    "idDrink": idDrink,
  };

  Drink toEntity() {
    return Drink(name: strDrink, image: strDrinkThumb, id: idDrink);
  }
}
