import 'dart:io';
import 'package:test/test.dart';
import '../lib/json_data.dart';

void main() {
  test('the json Data should have hasData false as default', () {
    var sut = JSONData();
    expect(sut.hasData, equals(false));
  });

  test('the json Data should have hasData true as default', () {
    var sut = JSONData();
    sut.load('./exampleFiles/jsonExample.json');
    expect(sut.hasData, equals(true));
  });

  test('the fields should be extract from json Data', () {
    var sut = JSONData();
    sut.load('./exampleFiles/jsonExample.json');
    expect(sut.fields.length, equals(5));
  });

  test('a new file should be save with json content', () {
    var sut = JSONData();
    sut.load('./exampleFiles/jsonExample.json');
    sut.save('./.generated/jsonExample.json');
    expect(File('./.generated/jsonExample.json').existsSync(), equals(true));
  });

  test('the json file should be unload and has data as false', () {
    var sut = JSONData();
    sut.load('./.generated/jsonExample.json');
    sut.clear();
    expect(sut.hasData, equals(false));
  });
}
