// Define a function that navigates to a new page

import 'package:flutter/material.dart';
import 'package:recyclopedia/map_component/recycle_map_component.dart';
import 'package:recyclopedia/models/area_location.dart';
import 'package:recyclopedia/screens/location_modal.dart';

/// This method navigate to a new RecycleMapComponent page, but with bug to be fixed.
/// To be more specific, when directing to the RecycleMapComponent, there is no way to navigate back.
void navigateToMap(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => RecycleMapComponent()),
            // LocationModal(location.name, location.address, location.image, location.howToFindBins)),
  );
}
