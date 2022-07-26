import 'package:flutter/cupertino.dart';
import 'package:meals_app/Widgets/meal_item_widget.dart';
import 'package:meals_app/models/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const route = '/CategoryMealScreen';

  const CategoryMealScreen({super.key});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitialData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitialData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      displayedMeals = dummyMeals
          .where((meal) => meal.categories.contains(routeArgs['id']))
          .toList();
    }
    _loadedInitialData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Categories',
        middle: Text(categoryTitle),
      ),
      child: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (context, index) => MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          duration: displayedMeals[index].duration,
          complexity: displayedMeals[index].complexity,
          affordability: displayedMeals[index].affordability,
          previousPageTitle: categoryTitle,
          removeMeal: _removeMeal,
        ),
      ),
    );
  }
}
