// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latlngJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLngJson _$LatLngJsonFromJson(Map<String, dynamic> json) => LatLngJson(
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngJsonToJson(LatLngJson instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
