import 'dart:io';
import 'package:csv/csv.dart';
import 'delimited_data.dart';

class CSVData implements DelimitedData {
  List<List<dynamic>> rows = [];
  String data='';

  bool hasData=false;

  List<String> get fields => rows.length > 0 ? rows[0].map((field) => field.toString()).toList() : [];

  void load(String fileName) {
    final csvString = File(fileName).readAsStringSync();
    // TODO: throw FileNotFoundError se não encontrar
    data = csvString;
    if(data != ''){
      // TODO: throw InvalidFile se não conseguir parsear o CSV
      rows = const CsvToListConverter().convert(csvString, eol:"\n");
      hasData = true;
    }else {
      rows = [];
      hasData = false;
    }
  }

  void save(String fileName) {
    final outFile = File(fileName);
    outFile.createSync(recursive: true);
    outFile.writeAsStringSync(data);
  }

  void clear() {
    rows = [];
    data = '';
    hasData = false;
  }

  String get separator => ',';
}