import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals_app/Widgets/meal_item_widget.dart';
import 'package:meals_app/models/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const route = '/CategoryMealScreen';

  const CategoryMealScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitialData = false;

  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  bool _isFilterShowing = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitialData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
        trailing: CupertinoButton(
          child: const Icon(
            Icons.filter_list,
          ),
          onPressed: () {
            setState(() {
              _isFilterShowing = !_isFilterShowing;
            });
          },
        ),
      ),
      child: _isFilterShowing
          ? Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gluten Free',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isGlutenFree = !_isGlutenFree;
                          });
                        },
                        child: CupertinoSwitch(
                          value: _isGlutenFree,
                          onChanged: (value) {
                            setState(() {
                              displayedMeals = dummyMeals
                                  .where((meal) => meal.isGlutenFree == value)
                                  .toList();
                              _isGlutenFree = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Vegan',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVegan = !_isVegan;
                          });
                        },
                        child: CupertinoSwitch(
                          value: _isVegan,
                          onChanged: (value) {
                            setState(() {
                              displayedMeals = dummyMeals
                                  .where((meal) => meal.isVegan == value)
                                  .toList();
                              _isVegan = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Vegetarian',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVegetarian = !_isVegetarian;
                          });
                        },
                        child: CupertinoSwitch(
                          value: _isVegetarian,
                          onChanged: (value) {
                            setState(() {
                              displayedMeals = dummyMeals
                                  .where((meal) => meal.isVegetarian == value)
                                  .toList();
                              _isVegetarian = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Lactose Free',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLactoseFree = !_isLactoseFree;
                          });
                        },
                        child: CupertinoSwitch(
                          value: _isLactoseFree,
                          onChanged: (value) {
                            setState(() {
                              displayedMeals = dummyMeals
                                  .where((meal) => meal.isLactoseFree == value)
                                  .toList();
                              _isLactoseFree = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : ListView.builder(
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
