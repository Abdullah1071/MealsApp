import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const route = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.systemGrey.withOpacity(0.2),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.white.withOpacity(0.7),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
            activeIcon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star),
            label: 'Favourites',
            activeIcon: Icon(CupertinoIcons.star_fill),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const CategoriesScreen();
          default:
            return const FavouritesScreen();
        }
      },
    );
  }
}
