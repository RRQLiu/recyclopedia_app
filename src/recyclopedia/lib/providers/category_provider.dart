import 'package:flutter/material.dart';
import 'package:recyclopedia/global_configuration.dart';

/// Provider of categories for trash items.
class CategoryProvider extends ChangeNotifier {
  String title = "Popular Category";
  late List allCategories;
  late List popularCategoryName;
  late List popularCategories;
  late List displayedCategories;

  CategoryProvider() {
    allCategories = categoryList;
    popularCategoryName = popularCategoryNames;
    popularCategories = allCategories
        .where((x) => popularCategoryName.contains(x["name"]))
        .toList();
    displayedCategories = popularCategories;
  }
  void search(String keywords) {
    if (keywords.isEmpty) {
      title = "Popular Category";
      displayedCategories = popularCategories;
    } else {
      title = "Search Results";
      displayedCategories = allCategories
          .where((item) =>
              item["name"].toLowerCase().contains(keywords.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
    }
    notifyListeners();
  }
}
