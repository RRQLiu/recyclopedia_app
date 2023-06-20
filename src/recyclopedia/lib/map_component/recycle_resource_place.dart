/// This file contains the information about class recycle_resource_place

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recyclopedia/map_component/latlngJson.dart';

part 'recycle_resource_place.g.dart';

// https://pub.dev/packages/json_serializable#enums
@JsonEnum()
enum PlaceCategory {
  // Shows the category of the marker on the map, could be one of the several kinds
  // TODO: need to discuss with client for how many kinds of resources there are -> change color or marker on map accordingly
  // recycleTrashBin,
  // recycleBox,
  // informationCenter,
  @JsonValue("binAvailable")
  binAvailable,
  @JsonValue("binUnavailable")
  binUnavailable;

  String toJson() => name;
  static PlaceCategory fromJson(String json) => values.byName(json);
}

// @ https://pub.dev/packages/json_serializable
@JsonSerializable()
/// Entity for displaying the location modal in Figma
class RecycleResourcePlace {
  final String locationID;
  final String areaNameL;
  String? areaNameS;
  final String areaAddress;
  final String areaImage;
  final String areaDescription;
  final PlaceCategory areaCategory;
  List<String> binList;
  List<List<String>> directions;
  double latitude;
  double longitude;

  /// this property is kept for compatibility with older code
  final LatLngJson latLng;
  // add ...as LatLngJson to places where argument_type_not_assignable error occurs.
  // or (the current solution) change RecycleResourcePlace constructor.

  // final LatLng latLng;
  // not supported by json_serializable.
  // Either change to simpler types suggested in json_serializable's documentation,
  // or add ...as LatLngJson to places where argument_type_not_assignable error occurs.
  // or (the current solution) change RecycleResourcePlace constructor.
  // no ? means that this field must be something else than null
  final String? building;

  // final dynamic stuff = {
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

  RecycleResourcePlace(
      {required this.locationID,
      required latLng,
      required this.areaNameL,
      required this.areaCategory,
      required this.areaDescription,
      required this.directions,
      this.building,
      required this.areaAddress,
      required this.binList,
      required this.areaImage,
      latitude,
      longitude})
      : latLng = latLng.runtimeType == LatLngJson
            ? latLng
            : latLng.runtimeType == LatLng
                ? LatLngJson.fromLatLng(latLng)
                : latLng.runtimeType == Map
                    ? LatLngJson.fromJson(latLng)
                    : LatLngJson(latitude, longitude),
        latitude = latitude,
        longitude = longitude;

  /// Connect the generated [_$RecycleResourcePlaceFromJson] function to the `fromJson`
  /// factory.
  factory RecycleResourcePlace.fromJson(Map<String, dynamic> json) =>
      _$RecycleResourcePlaceFromJson(json);

  get id => locationID;

  get category => areaCategory;

  get name => areaNameL;

  get description => areaDescription;

  get bins => binList;

  get address => areaAddress;

  get image => areaImage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecycleResourcePlace &&
          runtimeType == other.runtimeType &&
          locationID == other.locationID &&
          areaNameL == other.areaNameL &&
          areaAddress == other.areaAddress &&
          areaImage == other.areaImage &&
          areaDescription == other.areaDescription &&
          areaCategory == other.areaCategory &&
          binList == other.binList &&
          areaNameS == other.areaNameS &&
          latitude == other.latitude &&
          longitude == other.longitude;

  // double get latitude => latLng.latitude;

  // double get longitude => latLng.longitude;

  // String get addressOf => address; // what does this do?

  RecycleResourcePlace copyWith({
    String? id,
    LatLng? latLng,
    String? name,
    PlaceCategory? category,
    String? description,
    List<List<String>>? directions,
    String? building,
    String? address,
    List<String>? bins,
    String? image,
  }) {
    return RecycleResourcePlace(
      locationID: id ?? this.locationID,
      latLng: latLng ?? this.latLng,
      areaNameL: name ?? this.areaNameL,
      areaCategory: category ?? this.areaCategory,
      areaDescription: description ?? this.areaDescription,
      directions: directions ?? this.directions,
      building: building ?? this.building,
      areaAddress: address ?? this.areaAddress,
      binList: bins ?? this.binList,
      areaImage: image ?? this.areaImage,
    );
  }

  /// Connect the generated [_$RecycleResourcePlaceToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecycleResourcePlaceToJson(this);
  

}
