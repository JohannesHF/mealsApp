enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
   Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String id;
   List<String> categories;
   String title;
   String imageUrl;
   List<String> ingredients;
   List<String> steps;
   int duration;
   Complexity complexity;
   Affordability affordability;
   bool isGlutenFree;
   bool isLactoseFree;
   bool isVegan;
   bool isVegetarian;
}