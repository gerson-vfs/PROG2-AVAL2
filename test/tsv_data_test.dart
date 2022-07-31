import 'package:test/test.dart';
import '../lib/tsv_data.dart';
import '../lib/errors/no_data_error.dart';
import '../lib/errors/file_not_found_error.dart';
import '../lib/errors/invalid_format_error.dart';

void main() {
  test('TSVData should have hasData false as default', () {
    final sut = TSVData();
    expect(sut.hasData, equals(false));
  });

  test('TSVData should load tsv file data correctly', () {
    final sut = TSVData();
    sut.load('./files/example_files/tsv_example.tsv');
    expect(sut.rows.length, equals(8));
    expect(sut.data, equals('''id\tage\tname\tgender\temail
0\t29\tMagdalena Moreno\tfemale\tmagdalenamoreno@orbean.com
1\t23\tCasandra Mullen\tfemale\tcasandramullen@orbean.com
2\t30\tBrown Joyce\tmale\tbrownjoyce@orbean.com
3\t40\tCasey Pitts\tmale\tcaseypitts@orbean.com
4\t40\tLeah Barker\tfemale\tleahbarker@orbean.com
5\t35\tFaulkner Ross\tmale\tfaulknerross@orbean.com
6\t37\tLindsay Tanner\tmale\tlindsaytanner@orbean.com'''));
  });

  test('TSVData should get fields correctly after load tsv file', () {
    final sut = TSVData();
    sut.load('./files/example_files/tsv_example.tsv');
    expect(sut.fields, equals(['id','age','name','gender','email']));
  });

  test('TSVData should have hasData true after load tsv file', () {
    final sut = TSVData();
    sut.load('./files/example_files/tsv_example.tsv');
    expect(sut.hasData, equals(true));
  });

  test('TSVData should clear fields after load tsv file and call clear', () {
    final sut = TSVData();
    sut.load('./files/example_files/tsv_example.tsv');
    sut.clear();
    expect(sut.hasData, equals(false));
    expect(sut.data, equals(''));
    expect(sut.rows, equals([]));
    expect(sut.fields, equals([]));
  });

  test('TSVData should save tsv in filePath with correct Data', () {
    final sut = TSVData();
    sut.load('./files/example_files/tsv_example.tsv');
    final originalRows = sut.rows;
    final originalFields = sut.fields;
    final originalData = sut.data;
    sut.save('./files/.generated/tsv_equivalent.tsv');
    sut.clear();
    sut.load('./files/.generated/tsv_equivalent.tsv');
    expect(sut.rows, equals(originalRows));
    expect(sut.fields, equals(originalFields));
    expect(sut.data, equals(originalData));
    expect(sut.hasData, equals(true));
  });

  test('TSVData should throw file not found error', () {
    final sut = TSVData();
    expect(() => sut.load('./files/example_files/tsv_example_not_found.tsv'), throwsA(isA<FileNotFoundError>()));
  });

  test('TSVData should throw invalid format error', () {
    final sut = TSVData();
    expect(() => sut.load('./files/example_files/csv_example.csv'), throwsA(isA<InvalidFormatError>()));
  });

  test('TSVData should throw no data error', () {
    final sut = TSVData();
    expect(() => sut.save('./files/.generated/tsv_equivalent.tsv'), throwsA(isA<NoDataError>()));
  });
}
