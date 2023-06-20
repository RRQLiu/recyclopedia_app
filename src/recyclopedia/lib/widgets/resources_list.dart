import 'package:flutter/material.dart';
import 'package:recyclopedia/models/all.dart';


/// Keeps track of the changing Resources list.
@Deprecated("For Tests only, the resource page is updated in other files.")
class ResourcesList extends ChangeNotifier {
  var articles = <ResourceArticle>[];

  void updateResource() {
    // fetch resource list
    notifyListeners();
  }
}
