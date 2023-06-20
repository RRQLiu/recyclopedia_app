import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/all.dart';
import 'package:recyclopedia/providers/assets_provider.dart';
import 'package:recyclopedia/providers/category_provider.dart';
import 'package:recyclopedia/providers/location_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ///MyApp is the root of widgets tree
  ///Using multiProvider to link to other widgets
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyAppState()),
        ChangeNotifierProvider(create: (context) => ResourcesList()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => AssetsProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => MapState())
      ],
      child: MaterialApp(
        title: 'Recyclepedia',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: MainPage(),
      ),
    );
  }
}

// not used
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
