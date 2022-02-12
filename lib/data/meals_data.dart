import 'package:meal_menu/models/meal.dart';

import 'package:meal_menu/models/meal.dart';

List<Meal> meals = [
  Meal(
    name: 'Bok Choy',
    description:
        'Bok Choy cultivation was first done in China. Bok choy is used in many dishes due to its crisp texture, sweet flavor and nutritional value. It is also known as white cabbage. The Chinese commonly call Bok Choy as Pak Choy meaning white vegetable.',
    difficulty: MealDifficulty.easy,
    image: 'https://i.ndtvimg.com/mt/cooks/2014-11/1382352986_bokchoy.jpg',
    ingredients: [
      'Bok Choy is low in calories and high in vitamin A, C and calcium.',
      'Bok Choy free from saturated fat.',
      'It is also low in sodium and a good source of folate.',
    ],
    categoryId: '1',
    time: '15 Minutes',
  ),
  Meal(
    name: 'Snake Beans',
    description:
        'Snake beans are long and slender green pods with a sweet flavour and crunchy texture. Snake beans have a similar texture to that of green beans, but are slightly lighter green in colour. They are also known as yardlong beans, bora, long-podded cowpea, asparagus beans, pea beans or Chinese long beans.',
    difficulty: MealDifficulty.medium,
    image:
        'https://i.ndtvimg.com/i/2014-11/snake-beans_625x300_71416569505.jpg',
    ingredients: [
      'Snake beans are fat and cholesterol free.',
      'The beans are low in sodium and rich source of iron, fiber, potassium and zinc.',
      'Calcium and Vitamins B6 and B12 are in good proportions in these Chinese pods.',
    ],
    categoryId: '1',
    time: '10 Minutes',
  ),
];
