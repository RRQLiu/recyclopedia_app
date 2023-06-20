// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycle_resource_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecycleResourcePlace _$RecycleResourcePlaceFromJson(
        Map<String, dynamic> json) =>
    RecycleResourcePlace(
      locationID: json['locationID'] as String,
      latLng: json['latLng'],
      areaNameL: json['areaNameL'] as String,
      areaCategory: $enumDecode(_$PlaceCategoryEnumMap, json['areaCategory']),
      areaDescription: json['areaDescription'] as String,
      directions: (json['directions'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      building: json['building'] as String?,
      areaAddress: json['areaAddress'] as String,
      binList:
          (json['binList'] as List<dynamic>).map((e) => e as String).toList(),
      areaImage: json['areaImage'] as String,
      latitude: json['latitude'],
      longitude: json['longitude'],
    )..areaNameS = json['areaNameS'] as String?;

Map<String, dynamic> _$RecycleResourcePlaceToJson(
        RecycleResourcePlace instance) =>
    <String, dynamic>{
      'locationID': instance.locationID,
      'areaNameL': instance.areaNameL,
      'areaNameS': instance.areaNameS,
      'areaAddress': instance.areaAddress,
      'areaImage': instance.areaImage,
      'areaDescription': instance.areaDescription,
      'areaCategory': instance.areaCategory,
      'binList': instance.binList,
      'directions': instance.directions,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'latLng': instance.latLng,
      'building': instance.building,
    };

const _$PlaceCategoryEnumMap = {
  PlaceCategory.binAvailable: 'binAvailable',
  PlaceCategory.binUnavailable: 'binUnavailable',
};
