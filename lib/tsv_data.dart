import 'dart:io';
import 'package:csv/csv.dart';
import 'delimited_data.dart';

class TSVData implements DelimitedData {
  List<List<dynamic>> rows = [];
  String? data='';

  bool hasData=false;

  List<String> get fields => rows.length > 0 ? rows[0].map((field) => field.toString()).toList() : [];

  void load(String fileName) {
    final tsvString = File(fileName).readAsStringSync();
    // TODO: throw FileNotFoundError se não encontrar
    data = tsvString;
    if(data != ''){
      // TODO: throw InvalidFile se não conseguir parsear o TSV
      rows = const CsvToListConverter().convert(tsvString, eol: '\n', fieldDelimiter: '\t');
      hasData = true;
    }else {
      rows = [];
      hasData = false;
    }
  }

  void save(String fileName) {
    final outFile = File(fileName);
    outFile.createSync(recursive: true);
    outFile.writeAsStringSync(data ?? '');
  }

  void clear() {
    rows = [];
    data = '';
    hasData = false;
  }

  String get separator => ' ';
}