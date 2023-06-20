/// This file contains dummy data for display and testing only
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:recyclepidia/map_component/recycle_resource_place.dart';
import 'recycle_resource_place.dart';

class StubData {
  static String defaultTrackerViewType = "map";
  static String defaultCategory = "binAvailable";
  // static List<dynamic> defaultPlaces = [
  //   {
  //     "id": "1",
  //     "latLng": {"latitude": 42.3508, "longitude": -71.1089},
  //     "name": "George Sherman Union",
  //     "building": "GSU",
  //     "address": "George Sherman Union",
  //     "description": "Bins At GSU, tap to find more information",
  //     "category": "binAvailable",
  //     "directions": [
  //       ["Go to City Convenience,","the bin is right in front of it."],["Go to the first floor."]
  //     ],
  //     "bins": ["first floor ", "second floor"],
  //     "image": "/gsu.jpg"
  //   },
  //   {
  //     "id": '2',
  //     "latLng": {
  //       "latitude": 42.3495,
  //       "longitude": -71.1048
  //     }, // 42.3495° N, 71.1048° W
  //     "name": 'Warren Towers',
  //     "building": "Warren Towers",
  //     "address": "700 Commonwealth Ave, Boston, MA 02215",
  //     "category": "binUnavailable",
  //     "description": "Bins At WarrenTowers, tap to find more information",
  //     "directions": [["In front of the main entrance."], ["Go to first floor."]],
  //     "bins": ["first floor ", "second floor"],
  //     "image": "/warren.jpg",
  //   }
  // ];

  // static List<RecycleResourcePlace> places = [
  //   RecycleResourcePlace(
  //     id: '1',
  //     latLng: const LatLng(42.3508, -71.1089), //42.3509° N, 71.1089° W
  //     name: 'GSU Recycle Bin',
  //     building: "George Sherman Union",
  //     address: "775 Commonwealth Ave, Boston, MA 02215",
  //     description: 'Recycle bin located at the first floor of GSU',
  //     category: PlaceCategory.binAvailable,
  //     directions: ['<direction to find bin>'],
  //     bins: ["first floor", "second floor"],
  //     image: "./asset/gsu.jpg",
  //   ),
  //   RecycleResourcePlace(
  //     id: '2',
  //     latLng: const LatLng(42.3495, -71.1048), // 42.3495° N, 71.1048° W
  //     name: 'Warren Towers Recycle Box',
  //     building: "George Sherman Union",
  //     address: "700 Commonwealth Ave, Boston, MA 02215",
  //     description: "Bins At WarrenTowers, tap to find more information",
  //     category: PlaceCategory.binAvailable,
  //     directions: ['<direction to find bin>'],
  //     bins: ["first floor", "second floor"],
  //     image: "./asset/gsu.jpg",
  //   ),
  //   RecycleResourcePlace(
  //     id: '3',
  //     latLng: const LatLng(42.3503, -71.1054), // 42.3503° N, 71.1054° W
  //     name: 'CAS Recycle Bin',
  //     building: "College of Art&Sciences",
  //     address: "725 Commonwealth Ave, Boston, MA 02215",
  //     description: 'Recycle bin located at the first floor of CAS',
  //     category: PlaceCategory.binUnavailable,
  //     directions: ['<direction to find bin>'],
  //     bins: ["first floor", "second floor"],
  //     image: "./asset/gsu.jpg",
  //   ),
  //   RecycleResourcePlace(
  //     id: '4',
  //     latLng: const LatLng(42.3511, -71.1089), //42.3509° N, 71.1089° W
  //     name: 'GSU Recycle Center (imaginary)',
  //     building: "George Sherman Union",
  //     address: "775 Commonwealth Ave, Boston, MA 02215",
  //     description: 'Recycle center underground of GSU',
  //     category: PlaceCategory.binUnavailable,
  //     directions: ['<direction to find bin>'],
  //     bins: ["first floor", "second floor"],
  //     image: "./asset/gsu.jpg",
  //   ),
  // ];

  // static const reviewStrings = [
  //   'My favorite place in Portland. The employees are wonderful and so is the food. I go here at least once a month!',
  //   'Staff was very friendly. Great atmosphere and good music. Would recommend.',
  //   'Best. Place. In. Town. Period.'
  // ];
}

// class BULocation {
//   // this class maps a single location in bu with their longtitude/latitude
//   final String id;
//   final LatLng latLng;
//   final String locationFullName; // College of Art & Science
//   final String? locationSubName; // CAS

//   const BULocation({
//     required this.id,
//     required this.latLng,
//     required this.locationFullName,
//     this.locationSubName,
//   });
// }

// class LocationMapping {
//   static const List<BULocation> locations = [
//     BULocation(
//         id: '1',
//         latLng: LatLng(42.3508, -71.1089),
//         locationFullName: "George Sharman Union",
//         locationSubName: "GSU"),
//     BULocation(
//         id: '2',
//         latLng: LatLng(42.3495, -71.1048),
//         locationFullName: "Warren Towers"),
//     BULocation(
//         id: '3',
//         latLng: LatLng(42.3503, -71.1054),
//         locationFullName: "College or Art&Sciences",
//         locationSubName: "CAS"),
//   ];
// }
