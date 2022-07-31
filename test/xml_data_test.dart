import 'package:test/test.dart';
import '../lib/xml_data.dart';
import '../lib/errors/no_data_error.dart';
import '../lib/errors/file_not_found_error.dart';
import '../lib/errors/invalid_format_error.dart';

void main() {
  test('XMLData should have hasData false as default', () {
    final sut = XMLData();
    expect(sut.hasData, equals(false));
  });

  test('XMLData should load xml file data correctly', () {
    final sut = XMLData();
    sut.load('./files/example_files/xml_example.xml');
    expect(
        sut.data,
        equals(
            '<?xml version="1.0" encoding="UTF-8"?><root><element><id>0</id><age>29</age><name>Magdalena Moreno</name><gender>female</gender><email>magdalenamoreno@orbean.com</email></element><element><id>1</id><age>23</age><name>Casandra Mullen</name><gender>female</gender><email>casandramullen@orbean.com</email></element><element><id>2</id><age>30</age><name>Brown Joyce</name><gender>male</gender><email>brownjoyce@orbean.com</email></element><element><id>3</id><age>40</age><name>Casey Pitts</name><gender>male</gender><email>caseypitts@orbean.com</email></element><element><id>4</id><age>40</age><name>Leah Barker</name><gender>female</gender><email>leahbarker@orbean.com</email></element><element><id>5</id><age>35</age><name>Faulkner Ross</name><gender>male</gender><email>faulknerross@orbean.com</email></element><element><id>6</id><age>37</age><name>Lindsay Tanner</name><gender>male</gender><email>lindsaytanner@orbean.com</email></element></root>'));
  });

  test('XMLData should get fields correctly after load xml file', () {
    final sut = XMLData();
    sut.load('./files/example_files/xml_example.xml');
    expect(sut.fields, equals(['id', 'age', 'name', 'gender', 'email']));
  });

  test('XMLData should have hasData true after load xml file', () {
    final sut = XMLData();
    sut.load('./files/example_files/xml_example.xml');
    expect(sut.hasData, equals(true));
  });

  test('XMLData should clear fields after load xml file and call clear', () {
    final sut = XMLData();
    sut.load('./files/example_files/xml_example.xml');
    sut.clear();
    expect(sut.hasData, equals(false));
    expect(sut.data, equals(null));
    expect(sut.fields, equals([]));
  });

  test('XMLData should save xml in filePath with correct Data', () {
    final sut = XMLData();
    sut.load('./files/example_files/xml_example.xml');
    final originalFields = sut.fields;
    final originalData = sut.data;
    final originalHasData = sut.hasData;
    sut.save('./files/.generated/xml_equivalent.xml');
    sut.clear();
    sut.load('./files/.generated/xml_equivalent.xml');
    expect(sut.fields, equals(originalFields));
    expect(sut.data, equals(originalData));
    expect(sut.hasData, equals(originalHasData));
  });

  test('XMLData should throw file not found error', () {
    final sut = XMLData();
    expect(() => sut.load('./files/example_files/xml_example_not_found.xml'), throwsA(isA<FileNotFoundError>()));
  });

  test('XMLData should throw invalid format error', () {
    final sut = XMLData();
    expect(() => sut.load('./files/example_files/csv_example.csv'), throwsA(isA<InvalidFormatError>()));
  });

  test('XMLData should throw no data error', () {
    final sut = XMLData();
    expect(() => sut.save('./files/.generated/xml_equivalent.xml'), throwsA(isA<NoDataError>()));
  });
}
