import 'dart:io';
import 'package:test/test.dart';
import '../lib/jsonData.dart';

void main() {
  test('json Data should have hasData false as default', () {
    var sut = JsonData();
    expect(sut.hasData, equals(false));
  });

  test('an json file should be load and has data as true', () {
    var sut = JsonData();
    sut.load('./exampleFiles/jsonExample.json');
    expect(sut.hasData, equals(true));
  });

  test('the fields should be extract from json Data', () {
    var sut = JsonData();
    sut.load('./exampleFiles/jsonExample.json');
    expect(sut.fields.length, equals(5));
  });

  test('a new file should be save with json content', () {
    var sut = JsonData();
    sut.save('./exampleFiles/jsonExamplen.json');
    expect(File('./exampleFiles/jsonExamplen.json').existsSync(), equals(true));
  });

  test('an json file should be unload and has data as false', () {
    var sut = JsonData();
    sut.load('./exampleFiles/jsonExamplen.json');
    sut.clear();
    expect(sut.hasData, equals(false));
  });
}
