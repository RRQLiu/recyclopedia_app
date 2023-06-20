import 'package:flutter/material.dart';
import 'package:recyclopedia/global_configuration.dart';
import 'package:recyclopedia/campus_map_unused/area_location.dart';

class LocationProvider extends ChangeNotifier {
  late List<Map<String, dynamic>> locations;
  late List<AreaLocation> allLocations;

  LocationProvider() {
    List<Map<String, dynamic>> locations = defaultLocations;
    // print(locations);
    allLocations = locations.map((json) {
      // print(json);
      return AreaLocation.fromJson(json);
    },).toList();
  }
  void methodThatDoesNothing() {
    notifyListeners();
  }
}
