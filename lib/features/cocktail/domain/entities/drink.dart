class Drink {
  final String name;
  final String image;
  final String id;

  Drink({required this.name, required this.image, required this.id});
}

class DrinkDetail {
  final String id;
  final String name;
  final String? altName;
  final String tag;
  final String? videoUrl;
  final String category;
  final String type;
  final String alcoholic;
  final String glass;
  final Map<String, String> instructions;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> measures;
  final String imageSource;
  final String attribution;
  final bool creativeCommonConfirmed;
  final DateTime dateModified;

  DrinkDetail({
    required this.id,
    required this.name,
    required this.altName,
    required this.tag,
    required this.videoUrl,
    required this.category,
    required this.type,
    required this.alcoholic,
    required this.glass,
    required this.instructions,
    required this.imageUrl,
    required this.ingredients,
    required this.measures,
    required this.imageSource,
    required this.attribution,
    required this.creativeCommonConfirmed,
    required this.dateModified,
  });
}
