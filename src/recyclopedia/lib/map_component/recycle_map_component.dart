// this file contains everything needed to render the map component

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:collection';

import 'place_list.dart';
import 'place_map.dart';
import 'recycle_resource_place.dart'; // RecycleResourcePlace
import "stub_data.dart";
import 'place_details.dart';

enum PlaceTrackerViewType {
  map,
  list;

  static PlaceTrackerViewType fromJson(String json) => values.byName(json);
  String toJson() => name;
}

/// The RecycleMapComponent is the main container of the map component, 
/// it is responsible for the main layout and initiate the `MapState` class.
/// 
/// The `MapState` class is the most important part in this file, it allows the 
/// whole project to listen to the change within MapState then make modifications to the outcome 
class RecycleMapComponent extends StatelessWidget {
  const RecycleMapComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF2F935C),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0XFF2F935C),
          foregroundColor: Colors.white,
        ),
      ),
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const _PlaceTrackerHomePage(),
          routes: [
            GoRoute(
              path: 'place/:id',
              builder: (context, state) {
                final id = state.params['id']!;
                final place = context
                    .read<MapState>()
                    .places
                    .singleWhere((place) => place.id == id);
                return PlaceDetails(place: place);
              },
            ),
          ],
        ),
      ]),
    );
  }
}

class _PlaceTrackerHomePage extends StatelessWidget {
  /// This stateless widget renders the place tracker's root directory, which 
  /// would display the map component by default
  const _PlaceTrackerHomePage();

  @override
  Widget build(BuildContext context) {
    var mapState = Provider.of<MapState>(context);
    var viewType = mapState.viewType;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Recycling Bin Locations',
                    style: GoogleFonts.poppins(fontSize: 27.0)),
              ]),
            ]),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...'),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    viewType == PlaceTrackerViewType.map
                        ? Icons.list
                        : Icons.map,
                    size: 32.0,
                  ),
                  onPressed: () {
                    mapState.setViewType(
                      viewType == PlaceTrackerViewType.map
                          ? PlaceTrackerViewType.list
                          : PlaceTrackerViewType.map,
                    );
                  },
                ),
              ],
            )
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        backgroundColor: const Color(0XFF2F935C),
        toolbarHeight: 210,
      ),
      body: IndexedStack(
        index: viewType == PlaceTrackerViewType.map ? 0 : 1,
        children: const [
          PlaceMap(
              center: LatLng(
                  42.3505, -71.1054)), // BU location 42.3505° N, 71.1054° W
          PlaceList(), // shows place details for the given locations
        ],
      ),
    );
  }
}

class MapState extends ChangeNotifier {
  late List<RecycleResourcePlace> places;
  late PlaceCategory selectedCategory;
  late PlaceTrackerViewType viewType;

  MapState() {
    fetchPlaces();
    selectedCategory = PlaceCategory.fromJson(StubData.defaultCategory);
    viewType = PlaceTrackerViewType.fromJson(StubData.defaultTrackerViewType);
  }

  void fetchPlaces() async {
    places = await fetchLocation();
  }

  void setViewType(PlaceTrackerViewType viewType) {
    this.viewType = viewType;
    notifyListeners();
  }

  void setSelectedCategory(PlaceCategory newCategory) {
    selectedCategory = newCategory;
    notifyListeners();
  }

  void setPlaces(List<RecycleResourcePlace> newPlaces) {
    places = newPlaces;
    notifyListeners();
  }

  /// Get the list of locations
  Future<List<RecycleResourcePlace>> fetchLocation() async {
    // Sample json data
    // final dynamic locations = {
    //   "data": [
    //     {
    //       "id": 1,
    //       "attributes": {
    //         "locationID": "1",
    //         "areaNameL": "George Sherman Union",
    //         "areaAddress": "775 Commonwealth Ave",
    //         "areaImage": "/gsu.jpg",
    //         "areaDescription": "Bins At GSU, tap to find more information",
    //         "areaCategory": "binAvailable",
    //         "binList": "[\"first floor \", \"second floor\"]",
    //         "areaNameS": "GSU",
    //         "latitude": 42.3508,
    //         "longitude": -71.1089,
    //         "createdAt": "2023-05-06T01:51:42.305Z",
    //         "updatedAt": "2023-05-06T01:51:45.339Z",
    //         "publishedAt": "2023-05-06T01:51:45.333Z"
    //       }
    //     }
    //   ],
    //   "meta": {
    //     "pagination": {"page": 1, "pageSize": 25, "pageCount": 1, "total": 1}
    //   }
    // };

    // final dynamic locationbins = {
    //   "data": [
    //     {
    //       "id": 1,
    //       "attributes": {
    //         "address": "first floor",
    //         "instruction": "Go to school. Go to stairs.",
    //         "name": "bin1",
    //         "binID": "gsu1",
    //         "locationID": "1",
    //         "createdAt": "2023-05-06T05:15:30.980Z",
    //         "updatedAt": "2023-05-06T05:15:52.614Z",
    //         "publishedAt": "2023-05-06T05:15:52.611Z"
    //       }
    //     },
    //     {
    //       "id": 2,
    //       "attributes": {
    //         "address": "first floor",
    //         "instruction": "another bin.",
    //         "name": "bin2",
    //         "binID": "gsu2",
    //         "locationID": "1",
    //         "createdAt": "2023-05-06T05:16:22.865Z",
    //         "updatedAt": "2023-05-06T05:16:23.899Z",
    //         "publishedAt": "2023-05-06T05:16:23.896Z"
    //       }
    //     }
    //   ],
    //   "meta": {
    //     "pagination": {"page": 1, "pageSize": 25, "pageCount": 1, "total": 2}
    //   }
    // };

    final locationResponse = await http.get(Uri.parse(
        'https://strapi-development-6fb1.up.railway.app/api/area-locations'));

    if (locationResponse.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //
      Future<List<RecycleResourcePlace>> futureList =
          Stream.fromIterable(jsonDecode(locationResponse.body)["data"])
              .asyncMap((item) async {
        var place = item['attributes'];
        // log(jsonEncode(place['binList']));
        var placeID = place['locationID'];
        final BinResponse = await http.get(Uri.parse(
            "https://strapi-development-6fb1.up.railway.app/api/locations?filters[locationID][\$eq]=$placeID"));
        // log("https://strapi-development-6fb1.up.railway.app/api/locations?filters[locationID][\$eq]=$placeID");
        place['directions'] = jsonDecode(BinResponse.body)["data"].map((json) {
          // log(jsonEncode(json["attributes"]));
          String instructions = json["attributes"]["instruction"];
          // log(instructions);
          return instructions.split(";");
        }).toList();
        // log(jsonEncode(place['directions']));
        // log(jsonEncode(place['binList']));
        // log(jsonEncode(place['latitude']));
        place['binList'] = place['binList'].split(";");
        RecycleResourcePlace recycleResourcePlace =
            RecycleResourcePlace.fromJson(place);
        return recycleResourcePlace;
      }).toList();

      List<RecycleResourcePlace> result = await futureList;
      // print(result);

      return result;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Location');
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MapState &&
        other.places == places &&
        other.selectedCategory == selectedCategory &&
        other.viewType == viewType;
  }

  @override
  int get hashCode => Object.hash(places, selectedCategory, viewType);
}
