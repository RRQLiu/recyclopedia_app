// Define a function that navigates to a new page

import 'package:flutter/material.dart';
import 'package:recyclopedia/models/area_location.dart';
import 'package:recyclopedia/screens/location_modal.dart';

/// This method will navigate the page to ItemModal when an item is clicked in `RecycleMapComponent` page, list view.
@Deprecated("Now is built-in in the state _PlaceDetailsState from place_details.dart file")
void navigateToLocationModal(BuildContext context, AreaLocation location) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => 
            LocationModal(location.name, location.address, location.image, location.howToFindBins)),
  );
}
