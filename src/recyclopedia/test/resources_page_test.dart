import 'package:recyclopedia/screens/all.dart';
import 'package:recyclopedia/widgets/ResourceClass.dart';
import 'package:test/test.dart';

void main() {
  test('getAll() should return an array of Resource(s)', () {
    final testarr = getAll();
    expect(testarr, Future<List<Resource>>);
  });
}
