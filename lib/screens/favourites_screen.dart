import 'package:flutter/cupertino.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Favourites',
            ),
          ),
        ],
        body: const Center(
          child: Text('Favourites'),
        ),
      ),
    );
  }
}
