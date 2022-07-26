import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_data.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails({super.key});

  static const route = '/MealItemDetails';

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)!.settings.arguments as List<String>;
    final selectedMeal = dummyMeals.firstWhere(
      (meal) => meal.id == details[0],
    );
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(selectedMeal.title),
        previousPageTitle: details[1],
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            Icons.pending_outlined,
          ),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder:(context) => CupertinoActionSheet(
        actions: [
          Container(
            color: const Color.fromRGBO(28, 28, 29, 1),
            child: CupertinoActionSheetAction(
              isDestructiveAction: true,
              child: const Text(
                'Delete',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pop(details[0]);
              },
            ),
          ),
        ],
        cancelButton: Container(
          color: const Color.fromRGBO(28, 28, 29, 1),
          child: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
            );
          },
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildHeadings(context, 'Ingredients'),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(
                  color: CupertinoColors.systemGrey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: CupertinoColors.systemPink,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
              ),
            ),
            buildHeadings(context, 'Steps'),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(
                  color: CupertinoColors.systemGrey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Material(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: CupertinoColors.systemPink,
                          child: Text(
                            '#${index + 1}',
                          ),
                        ),
                        title: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemPink.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            selectedMeal.steps[index],
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeadings(BuildContext context, String text) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget buildActionSheet(BuildContext context, String mealID ) => CupertinoActionSheet(
        actions: [
          Container(
            color: const Color.fromRGBO(28, 28, 29, 1),
            child: CupertinoActionSheetAction(
              isDestructiveAction: true,
              child: const Text(
                'Delete',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pop(mealID);
              },
            ),
          ),
        ],
        cancelButton: Container(
          color: const Color.fromRGBO(28, 28, 29, 1),
          child: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      );
}
