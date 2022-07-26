import 'package:flutter/cupertino.dart';
import 'package:meals_app/screens/category_meal_screen.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meal_items_details_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor: CupertinoColors.darkBackgroundGray,
        scaffoldBackgroundColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        CategoryMealScreen.route: (context) => const CategoryMealScreen(),
        MealItemDetails.route: (context) => const MealItemDetails(),
      },
      initialRoute: '/',
    );
  }
}
