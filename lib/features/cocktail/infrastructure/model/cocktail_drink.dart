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
  final String idDrink;
  final String strDrink;
  final String strDrinkAlternate;
  final String strTags;
  final String strVideo;
  final String strCategory;
  final String strIBA;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;
  final String strInstructionsES;
  final String strInstructionsDE;
  final String strInstructionsFR;
  final String strInstructionsIT;
  final String strInstructionsZHS;
  final String strInstructionsZHT;
  final String strDrinkThumb;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strIngredient4;
  final String strIngredient5;
  final String strIngredient6;
  final String strIngredient7;
  final String strIngredient8;
  final String strIngredient9;
  final String strIngredient10;
  final String strIngredient11;
  final String strIngredient12;
  final String strIngredient13;
  final String strIngredient14;
  final String strIngredient15;
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  final String strMeasure4;
  final String strMeasure5;
  final String strMeasure6;
  final String strMeasure7;
  final String strMeasure8;
  final String strMeasure9;
  final String strMeasure10;
  final String strMeasure11;
  final String strMeasure12;
  final String strMeasure13;
  final String strMeasure14;
  final String strMeasure15;
  final String strImageSource;
  final String strImageAttribution;
  final String strCreativeCommonsConfirmed;
  final String dateModified;

  CocktailDrink({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkAlternate,
    required this.strTags,
    required this.strVideo,
    required this.strCategory,
    required this.strIBA,
    required this.strAlcoholic,
    required this.strGlass,
    required this.strInstructions,
    required this.strInstructionsES,
    required this.strInstructionsDE,
    required this.strInstructionsFR,
    required this.strInstructionsIT,
    required this.strInstructionsZHS,
    required this.strInstructionsZHT,
    required this.strDrinkThumb,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strImageSource,
    required this.strImageAttribution,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });

  factory CocktailDrink.fromJson(Map<String, dynamic> json) => CocktailDrink(
    idDrink: json['idDrink'] ?? '',
    strDrink: json['strDrink'] ?? '',
    strDrinkAlternate: json['strDrinkAlternate'] ?? '',
    strTags: json['strTags'] ?? '',
    strVideo: json['strVideo'] ?? '',
    strCategory: json['strCategory'] ?? '',
    strIBA: json['strIBA'] ?? '',
    strAlcoholic: json['strAlcoholic'] ?? '',
    strGlass: json['strGlass'] ?? '',
    strInstructions: json['strInstructions'] ?? '',
    strInstructionsES: json['strInstructionsES'] ?? '',
    strInstructionsDE: json['strInstructionsDE'] ?? '',
    strInstructionsFR: json['strInstructionsFR'] ?? '',
    strInstructionsIT: json['strInstructionsIT'] ?? '',
    strInstructionsZHS: json['"strInstructionsZH-HANS'] ?? '',
    strInstructionsZHT: json['strInstructionsZH-HANT'] ?? '',
    strDrinkThumb: json['strDrinkThumb'] ?? '',
    strIngredient1: json['strIngredient1'] ?? '',
    strIngredient2: json['strIngredient2'] ?? '',
    strIngredient3: json['strIngredient3'] ?? '',
    strIngredient4: json['strIngredient4'] ?? '',
    strIngredient5: json['strIngredient5'] ?? '',
    strIngredient6: json['strIngredient6'] ?? '',
    strIngredient7: json['strIngredient7'] ?? '',
    strIngredient8: json['strIngredient8'] ?? '',
    strIngredient9: json['strIngredient9'] ?? '',
    strIngredient10: json['strIngredient10'] ?? '',
    strIngredient11: json['strIngredient11'] ?? '',
    strIngredient12: json['strIngredient12'] ?? '',
    strIngredient13: json['strIngredient13'] ?? '',
    strIngredient14: json['strIngredient14'] ?? '',
    strIngredient15: json['strIngredient15'] ?? '',
    strMeasure1: json['strMeasure1'] ?? '',
    strMeasure2: json['strMeasure2'] ?? '',
    strMeasure3: json['strMeasure3'] ?? '',
    strMeasure4: json['strMeasure4'] ?? '',
    strMeasure5: json['strMeasure5'] ?? '',
    strMeasure6: json['strMeasure6'] ?? '',
    strMeasure7: json['strMeasure7'] ?? '',
    strMeasure8: json['strMeasure8'] ?? '',
    strMeasure9: json['strMeasure9'] ?? '',
    strMeasure10: json['strMeasure10'] ?? '',
    strMeasure11: json['strMeasure11'] ?? '',
    strMeasure12: json['strMeasure12'] ?? '',
    strMeasure13: json['strMeasure13'] ?? '',
    strMeasure14: json['strMeasure14'] ?? '',
    strMeasure15: json['strMeasure15'] ?? '',
    strImageSource: json['strImageSource'] ?? '',
    strImageAttribution: json['strImageAttribution'] ?? '',
    strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'] ?? '',
    dateModified: json['dateModified'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'idDrink': idDrink,
    'strDrink': strDrink,
    'strDrinkAlternate': strDrinkAlternate,
    'strTags': strTags,
    'strVideo': strVideo,
    'strCategory': strCategory,
    'strIBA': strIBA,
    'strAlcoholic': strAlcoholic,
    'strGlass': strGlass,
    'strInstructions': strInstructions,
    'strInstructionsES': strInstructionsES,
    'strInstructionsDE': strInstructionsDE,
    'strInstructionsFR': strInstructionsFR,
    'strInstructionsIT': strInstructionsIT,
    'strInstructionsZHS': strInstructionsZHS,
    'strInstructionsZHT': strInstructionsZHT,
    'strDrinkThumb': strDrinkThumb,
    'strIngredient1': strIngredient1,
    'strIngredient2': strIngredient2,
    'strIngredient3': strIngredient3,
    'strIngredient4': strIngredient4,
    'strIngredient5': strIngredient5,
    'strIngredient6': strIngredient6,
    'strIngredient7': strIngredient7,
    'strIngredient8': strIngredient8,
    'strIngredient9': strIngredient9,
    'strIngredient10': strIngredient10,
    'strIngredient11': strIngredient11,
    'strIngredient12': strIngredient12,
    'strIngredient13': strIngredient13,
    'strIngredient14': strIngredient14,
    'strIngredient15': strIngredient15,
    'strMeasure1': strMeasure1,
    'strMeasure2': strMeasure2,
    'strMeasure3': strMeasure3,
    'strMeasure4': strMeasure4,
    'strMeasure5': strMeasure5,
    'strMeasure6': strMeasure6,
    'strMeasure7': strMeasure7,
    'strMeasure8': strMeasure8,
    'strMeasure9': strMeasure9,
    'strMeasure10': strMeasure10,
    'strMeasure11': strMeasure11,
    'strMeasure12': strMeasure12,
    'strMeasure13': strMeasure13,
    'strMeasure14': strMeasure14,
    'strMeasure15': strMeasure15,
    'strImageSource': strImageSource,
    'strImageAttribution': strImageAttribution,
    'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
    'dateModified': dateModified,
  };

  Drink toEntityDrink() {
    return Drink(name: strDrink, image: strDrinkThumb, id: idDrink);
  }

  DrinkDetail toEntityDrinkDetail() {
    return DrinkDetail(
      id: idDrink,
      name: strDrink,
      altName: strDrinkAlternate,
      tag: strTags,
      videoUrl: strVideo,
      category: strCategory,
      type: strIBA,
      alcoholic: strAlcoholic,
      glass: strGlass,
      instructions: {
        'EN': strInstructions,
        'ES': strInstructionsES,
        'DE': strInstructionsDE,
        'FR': strInstructionsFR,
        'ZHS': strInstructionsZHS,
        'ZHT': strInstructionsZHT,
      },
      imageUrl: strDrinkThumb,
      ingredients: [
        strIngredient1,
        strIngredient2,
        strIngredient3,
        strIngredient4,
        strIngredient5,
        strIngredient6,
        strIngredient7,
        strIngredient8,
        strIngredient9,
        strIngredient10,
        strIngredient11,
        strIngredient12,
        strIngredient13,
        strIngredient14,
        strIngredient15,
      ].where((item) => item.isNotEmpty).toList(),
      measures: [
        strMeasure1,
        strMeasure2,
        strMeasure3,
        strMeasure4,
        strMeasure5,
        strMeasure6,
        strMeasure7,
        strMeasure8,
        strMeasure9,
        strMeasure10,
        strMeasure11,
        strMeasure12,
        strMeasure13,
        strMeasure14,
        strMeasure15,
      ].where((item) => item.isNotEmpty).toList(),
      imageSource: strImageSource,
      attribution: strImageAttribution,
      creativeCommonConfirmed: strCreativeCommonsConfirmed == 'Yes'
          ? true
          : false,
      dateModified: dateModified.isNotEmpty
          ? DateTime.parse(dateModified)
          : DateTime.now(),
    );
  }
}
