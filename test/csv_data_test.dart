import 'dart:io';
import 'package:test/test.dart';
import '../lib/csv_data.dart';

void main() {
  test('CSVData should have hasData false as default', () {
    final sut = CSVData();
    expect(sut.hasData, equals(false));
  });

  test('CSVData should load csv file data correctly', () {
    final sut = CSVData();
    sut.load('./example_files/csv_example.csv');
    expect(sut.rows.length, equals(8));
    expect(sut.data, equals('''id,age,name,gender,email
0,29,Magdalena Moreno,female,magdalenamoreno@orbean.com
1,23,Casandra Mullen,female,casandramullen@orbean.com
2,30,Brown Joyce,male,brownjoyce@orbean.com
3,40,Casey Pitts,male,caseypitts@orbean.com
4,40,Leah Barker,female,leahbarker@orbean.com
5,35,Faulkner Ross,male,faulknerross@orbean.com
6,37,Lindsay Tanner,male,lindsaytanner@orbean.com'''));
  });

  test('CSVData should get fields correctly after load csv file', () {
    final sut = CSVData();
    sut.load('./example_files/csv_example.csv');
    expect(sut.fields, equals(['id','age','name','gender','email']));
  });

  test('CSVData should have hasData true after load csv file', () {
    final sut = CSVData();
    sut.load('./example_files/csv_example.csv');
    expect(sut.hasData, equals(true));
  });

  test('CSVData should clear fields after load csv file and call clear', () {
    final sut = CSVData();
    sut.load('./example_files/csv_example.csv');
    sut.clear();
    expect(sut.hasData, equals(false));
    expect(sut.data, equals(''));
    expect(sut.rows, equals([]));
    expect(sut.fields, equals([]));
  });

  test('CSVData should save csv in filePath with correct Data', () {
    final sut = CSVData();
    sut.load('./example_files/csv_example.csv');
    final originalRows = sut.rows;
    final originalFields = sut.fields;
    final originalData = sut.data;
    sut.save('./.generated/csv_equivalent.csv');
    sut.clear();
    sut.load('./.generated/csv_equivalent.csv');
    expect(sut.rows, equals(originalRows));
    expect(sut.fields, equals(originalFields));
    expect(sut.data, equals(originalData));
    expect(sut.hasData, equals(true));
  });

  // TODO: escrever teste de throw error file not found
  // TODO: escrever teste de throw invalidFile 
}
