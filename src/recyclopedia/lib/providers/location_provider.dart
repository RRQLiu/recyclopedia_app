import 'package:flutter/material.dart';
import 'package:recyclopedia/global_configuration.dart';
import 'package:recyclopedia/models/area_location.dart';

/// Provide locations to the map component, currently unused.
@Deprecated('use MapState instead')

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

  /// method that does nothing
  void methodThatDoesNothing() {
    notifyListeners();
  }
}
