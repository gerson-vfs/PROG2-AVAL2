import './lib/json_data.dart';
import './lib/csv_data.dart';
import './lib/tsv_data.dart';
import './lib/xml_data.dart';

void main() {
  print("---------- JSON FILE ----------");
  final jsonFileName = './files/example_files/json_example.json';
  final jsonData = JSONData();
  jsonData.load(jsonFileName);
  print('has data: ${jsonData.hasData} \n');
  print('data: ${jsonData.data} \n');
  print('fields: ${jsonData.fields} \n');
  jsonData.save('./files/out_files/json_example_out.json');
  jsonData.clear();
  print('has data: ${jsonData.hasData} \n');
  print("Errors: \n");
  try {
    jsonData.save('./files/.generated/json_equivalent.json');
  } catch (e) {
    print(e);
  }

  try {
    jsonData.load('./files/example_files/json_example_not_found.json');
  } catch (e) {
    print(e);
  }

  try {
    jsonData.load('./files/example_files/csv_example.csv');
  } catch (e) {
    print(e);
  }
  print("\n \n");

  print("---------- CSV FILE ----------");
  final csvFileName = './files/example_files/csv_example.csv';
  final csvData = CSVData();
  csvData.load(csvFileName);
  print('has data: ${csvData.hasData} \n');
  print('data: ${csvData.data} \n');
  print('fields: ${csvData.fields} \n');
  csvData.save('./files/out_files/json_example_out.json');
  csvData.clear();
  print('has data: ${csvData.hasData} \n');
  print("Errors: \n");
  try {
    csvData.save('./files/.generated/csv_equivalent.csv');
  } catch (e) {
    print(e);
  }

  try {
    csvData.load('./files/example_files/csv_example_not_found.csv');
  } catch (e) {
    print(e);
  }

  try {
    csvData.load('./files/example_files/json_example.json');
  } catch (e) {
    print(e);
  }
  print("\n \n");

  print("---------- TSV FILE ----------");
  final tsvFileName = './files/example_files/tsv_example.tsv';
  final tsvData = TSVData();
  tsvData.load(tsvFileName);
  print('has data: ${tsvData.hasData} \n');
  print('data: ${tsvData.data} \n');
  print('fields: ${tsvData.fields} \n');
  tsvData.save('./files/out_files/json_example_out.json');
  tsvData.clear();
  print('has data: ${tsvData.hasData} \n');
  print("Errors: \n");
  try {
    tsvData.save('./files/.generated/tsv_equivalent.tsv');
  } catch (e) {
    print(e);
  }

  try {
    tsvData.load('./files/example_files/tsv_example_not_found.tsv');
  } catch (e) {
    print(e);
  }

  try {
    tsvData.load('./files/example_files/json_example.json');
  } catch (e) {
    print(e);
  }
  print("\n \n");

  print("---------- XML FILE ----------");
  final xmlFileName = './files/example_files/xml_example.xml';
  final xmlData = XMLData();
  xmlData.load(xmlFileName);
  print('has data: ${xmlData.hasData} \n');
  print('data: ${xmlData.data} \n');
  print('fields: ${xmlData.fields} \n');
  xmlData.save('./files/out_files/xml_example_out.xml');
  xmlData.clear();
  print('has data: ${xmlData.hasData} \n');
  print("Errors: \n");
  try {
    xmlData.save('./files/.generated/xml_equivalent.xml');
  } catch (e) {
    print(e);
  }

  try {
    xmlData.load('./files/example_files/xml_example_not_found.xml');
  } catch (e) {
    print(e);
  }

  try {
    xmlData.load('./files/example_files/json_example.json');
  } catch (e) {
    print(e);
  }
  print("\n \n");


  print(
      "Integrantes do Grupo: \n João de Oliveira Castro Neto \n Gerson Victor \n Daniel Farias");
}
