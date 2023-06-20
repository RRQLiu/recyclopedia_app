/// This file contains the information needed to render 
/// the google map in our map component.

import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'recycle_resource_place.dart';
import 'recycle_map_component.dart';

/// Keep track of the places and categories needed to disolay the map.
class MapConfiguration {
  final List<RecycleResourcePlace> places;

  final PlaceCategory selectedCategory;

  const MapConfiguration({
    required this.places,
    required this.selectedCategory,
  });

  @override
  int get hashCode => places.hashCode ^ selectedCategory.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is MapConfiguration &&
        other.places == places &&
        other.selectedCategory == selectedCategory;
  }

  static MapConfiguration of(MapState mapState) {
    return MapConfiguration(
      places: mapState.places,
      selectedCategory: mapState.selectedCategory,
    );
  }
}

/// Renders the map component, including markers and features
class PlaceMap extends StatefulWidget {
  final LatLng? center;

  const PlaceMap({
    super.key,
    this.center,
  });

  @override
  State<PlaceMap> createState() => _PlaceMapState();
}

class _PlaceMapState extends State<PlaceMap> {
  Completer<GoogleMapController> mapController = Completer();

  MapType _currentMapType = MapType.normal;

  LatLng? _lastMapPosition;

  final Map<Marker, RecycleResourcePlace> _markedPlaces = <Marker, RecycleResourcePlace>{};

  final Set<Marker> _markers = {};

  Marker? _pendingMarker;

  MapConfiguration? _configuration;


// the commented section below would cause an error where it would not allow us to switch categories.
/////////////////////////
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<MapState>().addListener(_watchMapConfigurationChanges);
  // }

  // @override
  // void dispose() {
  //   context.read<MapState>().removeListener(_watchMapConfigurationChanges);
  //   super.dispose();
  // }

  // Future<void> _watchMapConfigurationChanges() async {
  //   final mapState = context.read<MapState>();
  //   _configuration ??= MapConfiguration.of(mapState);
  //   final newConfiguration = MapConfiguration.of(mapState);

  //   // Since we manually update [_configuration] when place or selectedCategory
  //   // changes come from the [place_map], we should only enter this if statement
  //   // when returning to the [place_map] after changes have been made from
  //   // [place_list].
  //   if (_configuration != newConfiguration) {
  //     if (_configuration!.places == newConfiguration.places &&
  //         _configuration!.selectedCategory !=
  //             newConfiguration.selectedCategory) {
  //       // If the configuration change is only a category change, just update
  //       // the marker visibilities.
  //       await _showPlacesForSelectedCategory(newConfiguration.selectedCategory);
  //     } else {
  //       // At this point, we know the places have been updated from the list
  //       // view. We need to reconfigure the map to respect the updates.
  //       for (final place in newConfiguration.places) {
  //         final oldPlace =
  //             _configuration!.places.firstWhereOrNull((p) => p.id == place.id);
  //         if (oldPlace == null || oldPlace != place) {
  //           // New place or updated place.
  //           _updateExistingPlaceMarker(place: place);
  //         }
  //       }

  //       await _zoomToFitPlaces(
  //         _getPlacesForCategory(
  //           newConfiguration.selectedCategory,
  //           newConfiguration.places,
  //         ),
  //       );
  //     }
  //     _configuration = newConfiguration;
  //   }
  // }
  // void _updateExistingPlaceMarker({required RecycleResourcePlace place}) {
  //   var marker = _markedPlaces.keys
  //       .singleWhere((value) => _markedPlaces[value]!.id == place.id);

  //   setState(() {
  //     final updatedMarker = marker.copyWith(
  //       infoWindowParam: InfoWindow(
  //         title: place.name,
  //         snippet: place.description != "" ? '${place.description} ' : null,
  //       ),
  //     );
  //     _updateMarker(marker: marker, updatedMarker: updatedMarker, place: place);
  //   });
  // }
//////////////////////////////

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<MapState>(context, listen: true);
    return Center(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: widget.center!,
                zoom: 16.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: (position) => _lastMapPosition = position.target,
            ),
            _CategoryButtonBar(
              selectedPlaceCategory: state.selectedCategory,
              visible: _pendingMarker == null,
              onChanged: _switchSelectedCategory,
            ),
            _MapFabs(
              visible: _pendingMarker == null,
              onToggleMapTypePressed: _onToggleMapTypePressed,
            ),
          ],
        ),
      );
  }
	/// Create a map with details on it for rendering
  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController.complete(controller);
    _lastMapPosition = widget.center;

    // Draw initial place markers on creation so that we have something
    // interesting to look at.
    var markers = <Marker>{};
    for (var place in Provider.of<MapState>(context, listen: false).places) {
      markers.add(await _createPlaceMarker(context, place));
    }
    setState(() {
      _markers.addAll(markers);
    });

    // Zoom to fit the initially selected category.
    _zoomToFitSelectedCategory();
  }

  @override
  void didUpdateWidget(PlaceMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Zoom to fit the selected category.
    if (mounted) {
      _zoomToFitSelectedCategory();
    }
  }

  /// Applies zoom to fit the places of the selected category
  void _zoomToFitSelectedCategory() {
    _zoomToFitPlaces(
      _getPlacesForCategory(
        Provider.of<MapState>(context, listen: false).selectedCategory,
        _markedPlaces.values.toList(),
      ),
    );
  }
	/// Create a marker on the map when called.
  Future<Marker> _createPlaceMarker(BuildContext context, RecycleResourcePlace place) async {
    final marker = Marker(
      markerId: MarkerId(place.latLng.toString()),
      position: place.latLng,
      infoWindow: InfoWindow(
        title: place.name,
        snippet: '${place.description} description',
        onTap: () => context.go('/place/${place.id}'),
      ),
      icon: await _getPlaceMarkerIcon(context, place.category),
      visible: place.category ==
          Provider.of<MapState>(context, listen: false).selectedCategory,
    );
    _markedPlaces[marker] = place;
    return marker;
  }

	/// Switch the view type of the map.
  void _onToggleMapTypePressed() {
    final nextType =
    MapType.values[(_currentMapType.index + 1) % MapType.values.length];

    setState(() {
      _currentMapType = nextType;
    });
  }

	/// Show the correct markers for the selected category.
  Future<void> _showPlacesForSelectedCategory(PlaceCategory category) async {
    setState(() {
      for (var marker in List.of(_markedPlaces.keys)) {
        final place = _markedPlaces[marker]!;
        final updatedMarker = marker.copyWith(
          visibleParam: place.category == category,
        );

        _updateMarker(
          marker: marker,
          updatedMarker: updatedMarker,
          place: place,
        );
      }
    });

    await _zoomToFitPlaces(_getPlacesForCategory(
      category,
      _markedPlaces.values.toList(),
    ));
  }
	
	/// Switch the category displayed
  Future<void> _switchSelectedCategory(PlaceCategory category) async {
    Provider.of<MapState>(context, listen: false).setSelectedCategory(category);
    await _showPlacesForSelectedCategory(category);
  }

  void _updateMarker({
    required Marker? marker,
    required Marker updatedMarker,
    required RecycleResourcePlace place,
  }) {
    _markers.remove(marker);
    _markedPlaces.remove(marker);

    _markers.add(updatedMarker);
    _markedPlaces[updatedMarker] = place;
  }
	
	/// Zoom to fit places after the map has been created.
  Future<void> _zoomToFitPlaces(List<RecycleResourcePlace> places) async {
    var controller = await mapController.future;

    // Default min/max values to latitude and longitude of center.
    var minLat = widget.center!.latitude;
    var maxLat = widget.center!.latitude;
    var minLong = widget.center!.longitude;
    var maxLong = widget.center!.longitude;

    for (var place in places) {
      minLat = min(minLat, place.latitude);
      maxLat = max(maxLat, place.latitude);
      minLong = min(minLong, place.longitude);
      maxLong = max(maxLong, place.longitude);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(minLat, minLong),
            northeast: LatLng(maxLat, maxLong),
          ),
          48.0,
        ),
      );
    });
  }

	/// Get marker icons from asset folder
  static Future<BitmapDescriptor> _getPlaceMarkerIcon(
      BuildContext context, PlaceCategory category) async {
    var marker = BitmapDescriptor.fromAssetImage(
            createLocalImageConfiguration(context, size: const Size(32,48)),
            '/map_markers/blank_green.png');
    switch (category) {
      case PlaceCategory.binAvailable: 
        return marker;
      case PlaceCategory.binUnavailable:
        marker = BitmapDescriptor.fromAssetImage(
            createLocalImageConfiguration(context, size: const Size(32,48)),
            '/map_markers/blank_grey.png');
        return marker;
      default:
        return marker;
    }
  }

	/// Get the selected Category.
  static List<RecycleResourcePlace> _getPlacesForCategory(
      PlaceCategory category, List<RecycleResourcePlace> places) {
    return places.where((place) => place.category == category).toList();
  }
}

/// Renders the component for selecting category.
class _CategoryButtonBar extends StatelessWidget {
  final PlaceCategory selectedPlaceCategory;
  final bool visible;
  final ValueChanged<PlaceCategory> onChanged;

  const _CategoryButtonBar({
    required this.selectedPlaceCategory,
    required this.visible,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 14.0),
        alignment: Alignment.bottomCenter,
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor:
                      selectedPlaceCategory == PlaceCategory.binAvailable
                          ? Colors.green[700]
                          : Colors.lightGreen),
              child: const Text(
                'Bin Available',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              onPressed: () => onChanged(PlaceCategory.binAvailable),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor:
                      selectedPlaceCategory == PlaceCategory.binUnavailable
                          ? Colors.green[700]
                          : Colors.lightGreen),
              child: const Text(
                'Bin Unavailable',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              onPressed: () => onChanged(PlaceCategory.binUnavailable),
            ),
          ],
        ),
      ),
    );
  }
}

/// Responsible for the functionality on the map.
class _MapFabs extends StatelessWidget {
  final bool visible;
  final VoidCallback onToggleMapTypePressed;

  const _MapFabs({
    required this.visible,
    required this.onToggleMapTypePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 12.0, right: 12.0),
      child: Visibility(
        visible: visible,
        child: Column(
          children: [
            FloatingActionButton(
              heroTag: 'toggle_map_type_button',
              onPressed: onToggleMapTypePressed,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              // mini: true,
              child: const Icon(Icons.layers, size: 28.0),
            ),
          ],
        ),
      ),
    );
  }
}
