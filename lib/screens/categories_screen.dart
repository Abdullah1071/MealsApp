import 'package:flutter/cupertino.dart';
import 'package:meals_app/Widgets/category_item_widget.dart';
import 'package:meals_app/models/dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Categories',
            ),
          ),
        ],
        body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                itemCount: dummyCategory.length,
                itemBuilder: (context, index) => CategoryItem(
                  id: dummyCategory[index].id,
                  title: dummyCategory[index].title,
                  color: dummyCategory[index].color,
                ),
              ),
      ),
    );
  }
}
