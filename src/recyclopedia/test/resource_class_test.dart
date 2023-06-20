import 'package:recyclopedia/screens/all.dart';
import 'package:recyclopedia/widgets/ResourceClass.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  test('Resource Class should mutate an object', () async {
    var data = await Uri.parse('tests/test_class.json');
    var jsonData = json.decode(data as String);
    final format = Resource.fromJson(jsonData);

    expect(format, Resource);
  });
}
