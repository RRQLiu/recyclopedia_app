// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaLocation _$AreaLocationFromJson(Map<String, dynamic> json) => AreaLocation(
      name: json['name'] as String,
      address: json['address'] as String,
      image: json['image'] as String,
      howToFindBins: (json['howToFindBins'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$AreaLocationToJson(AreaLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'image': instance.image,
      'howToFindBins': instance.howToFindBins,
    };
