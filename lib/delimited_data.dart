import 'dart:io';
import 'package:csv/csv.dart';
import './data.dart';
import './errors/no_data_error.dart';
import './errors/file_not_found_error.dart';
import './errors/invalid_format_error.dart';
import './errors/read_file_error.dart';
import './errors/write_file_error.dart';

abstract class DelimitedData extends Data {
  List<List<dynamic>> rows = [];
  String? data='';

  bool hasData=false;

  List<String> get fields => rows.length > 0 ? rows[0].map((field) => field.toString()).toList() : [];

  void load(String fileName) {
    final file = File(fileName);
    
    if (!file.existsSync()) {
      throw FileNotFoundError(file.path);
    }

    final dataString = file.readAsStringSync();
    
    data = dataString;
    if(data != ''){
      try{
        rows = const CsvToListConverter().convert(dataString, eol: '\n', fieldDelimiter: separator, allowInvalid: false);
        hasData = true;
        for(var i = 1; i < rows.length; i++){
          if(rows[i].length != rows[i-1].length) {
            throw InvalidFormatError("Invalid data format");
          }
        }
      } catch (e) {
        throw InvalidFormatError("Invalid data format");
      }
    }else {
      rows = [];
      hasData = false;
    }
  }

  void save(String fileName) {
    if(!hasData){
      throw NoDataError();
    }

    final outFile = File(fileName);
    outFile.createSync(recursive: true);
    outFile.writeAsStringSync(data ?? '');
  }

  void clear() {
    rows = [];
    data = '';
    hasData = false;
  }

  String get separator;
}
