import 'package:test/test.dart';
import '../lib/json_data.dart';

void main() {
  test('JSONData should have hasData false as default', () {
    var sut = JSONData();
    expect(sut.hasData, equals(false));
  });

  test('JSONData should load json file data correctly', () {
    var sut = JSONData();
    sut.load('./example_files/json_example.json');
    expect(sut.fields.length, equals(5));
    expect(sut.data, equals('[{"id":0,"age":29,"name":"Magdalena Moreno","gender":"female","email":"magdalenamoreno@orbean.com"},{"id":1,"age":23,"name":"Casandra Mullen","gender":"female","email":"casandramullen@orbean.com"},{"id":2,"age":30,"name":"Brown Joyce","gender":"male","email":"brownjoyce@orbean.com"},{"id":3,"age":40,"name":"Casey Pitts","gender":"male","email":"caseypitts@orbean.com"},{"id":4,"age":40,"name":"Leah Barker","gender":"female","email":"leahbarker@orbean.com"},{"id":5,"age":35,"name":"Faulkner Ross","gender":"male","email":"faulknerross@orbean.com"},{"id":6,"age":37,"name":"Lindsay Tanner","gender":"male","email":"lindsaytanner@orbean.com"}]'));
  });

  test('JSONData should be compatible json file with object data', () {
    var sut = JSONData();
    sut.load('./example_files/json_example_case2.json');
    expect(sut.fields.length, equals(5));
    expect(sut.data, equals('[{"id":0,"age":29,"name":"Magdalena Moreno","gender":"female","email":"magdalenamoreno@orbean.com"}]'));
  });

  test('JSONData should get fields correctly after load json file', () {
    var sut = JSONData();
    sut.load('./example_files/json_example.json');
    expect(sut.fields, equals(['id','age','name','gender','email']));
  });

  test('JSONData should have hasData true after load json file', () {
    var sut = JSONData();
    sut.load('./example_files/json_example.json');
    expect(sut.hasData, equals(true));
  });

  test('JSONData should clear fields after load json file and call clear', () {
    var sut = JSONData();
    sut.load('./example_files/json_example.json');
    sut.clear();
    expect(sut.hasData, equals(false));
    expect(sut.data, equals(null));
    expect(sut.fields, equals([]));
  });

  test('JSONData should save json in filePath with correct Data', () {
    var sut = JSONData();
    sut.load('./example_files/json_example.json');
    var originalFields = sut.fields;
    var originalData = sut.data;
    sut.save('./.generated/json_equivalent.json');
    sut.clear();
    sut.load('./.generated/json_equivalent.json');
    expect(sut.fields, equals(originalFields));
    expect(sut.data, equals(originalData));
    expect(sut.hasData, equals(true));
  });
}
