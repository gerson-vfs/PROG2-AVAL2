import 'package:test/test.dart';
import '../lib/json_data.dart';
import '../lib/errors/no_data_error.dart';
import '../lib/errors/file_not_found_error.dart';
import '../lib/errors/invalid_format_error.dart';

void main() {
  test('JSONData should have hasData false as default', () {
    final sut = JSONData();
    expect(sut.hasData, equals(false));
  });

  test('JSONData should load json file data correctly', () {
    final sut = JSONData();
    sut.load('./example_files/json_example.json');
    expect(sut.fields.length, equals(5));
    expect(sut.data, equals('[{"id":0,"age":29,"name":"Magdalena Moreno","gender":"female","email":"magdalenamoreno@orbean.com"},{"id":1,"age":23,"name":"Casandra Mullen","gender":"female","email":"casandramullen@orbean.com"},{"id":2,"age":30,"name":"Brown Joyce","gender":"male","email":"brownjoyce@orbean.com"},{"id":3,"age":40,"name":"Casey Pitts","gender":"male","email":"caseypitts@orbean.com"},{"id":4,"age":40,"name":"Leah Barker","gender":"female","email":"leahbarker@orbean.com"},{"id":5,"age":35,"name":"Faulkner Ross","gender":"male","email":"faulknerross@orbean.com"},{"id":6,"age":37,"name":"Lindsay Tanner","gender":"male","email":"lindsaytanner@orbean.com"}]'));
  });

  test('JSONData should get fields correctly after load json file', () {
    final sut = JSONData();
    sut.load('./example_files/json_example.json');
    expect(sut.fields, equals(['id','age','name','gender','email']));
  });

  test('JSONData should have hasData true after load json file', () {
    final sut = JSONData();
    sut.load('./example_files/json_example.json');
    expect(sut.hasData, equals(true));
  });

  test('JSONData should clear fields after load json file and call clear', () {
    final sut = JSONData();
    sut.load('./example_files/json_example.json');
    sut.clear();
    expect(sut.hasData, equals(false));
    expect(sut.data, equals(null));
    expect(sut.fields, equals([]));
  });

  test('JSONData should save json in filePath with correct Data', () {
    final sut = JSONData();
    sut.load('./example_files/json_example.json');
    final originalFields = sut.fields;
    final originalData = sut.data;
    sut.save('./.generated/json_equivalent.json');
    sut.clear();
    sut.load('./.generated/json_equivalent.json');
    expect(sut.fields, equals(originalFields));
    expect(sut.data, equals(originalData));
    expect(sut.hasData, equals(true));
  });

  test('JSONData should throw file not found error', () {
    final sut = JSONData();
    expect(() => sut.load('./example_files/json_example_not_found.json'), throwsA(isA<FileNotFoundError>()));
  });

  test('JSONData should throw invalid format error', () {
    final sut = JSONData();
    expect(() => sut.load('./example_files/csv_example.csv'), throwsA(isA<InvalidFormatError>()));
  });

  test('JSONData should throw no data error', () {
    final sut = JSONData();
    expect(() => sut.save('./.generated/json_equivalent.json'), throwsA(isA<NoDataError>()));
  });
}