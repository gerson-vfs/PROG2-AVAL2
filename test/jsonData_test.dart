import 'package:test/test.dart';
import '../lib/jsonData.dart';

void main() {
  test('json Data should have hasData false as default', () {
    var sut = JsonData();
    expect(sut.hasData, equals(false));
  });
}