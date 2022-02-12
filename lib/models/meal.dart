enum MealDifficulty {
  easy,
  medium,
  hard,
}

class Meal {
  final String name;
  final String description;
  final MealDifficulty difficulty;
  final String image;
  final List<String> ingredients;
  final String categoryId;
  final String time;

  String get difficultyText {
    switch (difficulty) {
      case MealDifficulty.easy:
        return 'Easy';
      case MealDifficulty.medium:
        return 'Medium';
      case MealDifficulty.hard:
        return 'Hard';
    }
  }

  Meal({
    required this.name,
    required this.description,
    required this.difficulty,
    required this.image,
    required this.ingredients,
    required this.categoryId,
    required this.time,
  });
}
