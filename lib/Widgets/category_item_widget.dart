import 'package:flutter/cupertino.dart';
import 'package:meals_app/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.id, required this.title, required this.color});

  final String id;
  final String title;
  final CupertinoDynamicColor color;

  void categoryRoute(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.route,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => categoryRoute(context),
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
