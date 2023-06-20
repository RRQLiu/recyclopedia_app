import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/main.dart';
import 'package:recyclopedia/campus_map_unused/location_provider.dart';
import 'package:recyclopedia/campus_map_unused/navigate_to_location_modal.dart';
// Temporary, for testing location modal
// override if needed
class CampusMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locationProvider = context.watch<LocationProvider>();
    var locations = locationProvider.allLocations;
    
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        // Let the ListView know how many items it needs to build.
        itemCount: locations.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          var location = locations[index];
          return ListTile(
              title: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    navigateToLocationModal(context, location);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                      //     borderRadius: BorderRadius.circular(20),
                      //     boxShadow: const [
                      //       BoxShadow(
                      //         color: Color(0XFF4B905F),
                      //         offset: Offset(4, 4),
                      //         blurRadius: 0.0,
                      //         spreadRadius: 0.0,
                      //       )
                      //     ],
                          border: Border.all(color: const Color(0XFF4B905F), width: 3)),
                      child: Text(location.name))));
        },
      ),
    );
  }
}
