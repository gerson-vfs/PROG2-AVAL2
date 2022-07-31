import './lib/json_data.dart';
import './lib/csv_data.dart';
import './lib/tsv_data.dart';
import './lib/xml_data.dart';

void main() {
  print("---------- JSON FILE ----------");
  final jsonFileName = './example_files/json_example.json';
  final jsonData = JSONData();
  jsonData.load(jsonFileName);
  print(jsonData.hasData);
  print(jsonData.data);
  print(jsonData.fields);
  jsonData.save('./.generated/json_example_out.json');
  jsonData.clear();
  print(jsonData.hasData);
  print("\n");
  print("\n");

  print("---------- CSV FILE ----------");
  final csvFileName = './example_files/csv_example.csv';
  final csvData = CSVData();
  csvData.load(csvFileName);
  print(csvData.hasData);
  print(csvData.data);
  print(csvData.fields);
  csvData.save('./.generated/csv_example_out.csv');
  csvData.clear();
  print(csvData.hasData);
  print("\n");
  print("\n");

  print("---------- TSV FILE ----------");
  final tsvFileName = './example_files/tsv_example.tsv';
  final tsvData = TSVData();
  tsvData.load(tsvFileName);
  print(tsvData.hasData);
  print(tsvData.data);
  print(tsvData.fields);
  tsvData.save('./.generated/tsv_example_out.tsv');
  tsvData.clear();
  print(tsvData.hasData);
  print("\n");
  print("\n");

  print("---------- XML FILE ----------");
  final xmlFileName = './example_files/xml_example.xml';
  final xmlData = XMLData();
  xmlData.load(xmlFileName);
  print(xmlData.hasData);
  print(xmlData.data);
  print(xmlData.fields);
  xmlData.save('./.generated/xml_example_out.xml');
  xmlData.clear();
  print(xmlData.hasData);
  print("\n");
  print("\n");

  print("Integrantes do Grupo: \n");
  print("João Castro Neto");
  print("Gerson Victor");
  print("Daniel Farias");
}
