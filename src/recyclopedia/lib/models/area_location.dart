/* 
@ https://pub.dev/packages/json_serializable

Part of the this class' method is generated.

After edit/update, do the following:
With a Dart package, run dart run build_runner build in the package directory.
With a Flutter package, run flutter pub run build_runner build in your package directory. 
*/
import 'package:json_annotation/json_annotation.dart';

part 'area_location.g.dart';

/// This hold the type for arealocations needed for location provider. Currently unused
@JsonSerializable()
class AreaLocation{
  /// The generated code assumes these values exist in JSON.
  final String name, address, image;
  final Map<String, List<String>> howToFindBins;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  // final DateTime? dateOfBirth;

  AreaLocation({required this.name, required this.address, required this.image, required this.howToFindBins});

  /// Connect the generated [_$AreaLocationFromJson] function to the `fromJson`
  /// factory.
  factory AreaLocation.fromJson(Map<String, dynamic> json) => _$AreaLocationFromJson(json);

  /// Connect the generated [_$AreaLocationToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AreaLocationToJson(this);
}
