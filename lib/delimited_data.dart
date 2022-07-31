import 'package:csv/csv.dart';
import './data.dart';
import './errors/invalid_format_error.dart';

abstract class DelimitedData extends Data {
  List<List<dynamic>> rows = [];
  String? _data = null;
  
  String? get data => _data;

  void set data(String? raw) {
    if (raw != '' && raw != null) {
      try {
        rows = const CsvToListConverter().convert(raw, eol: '\n', fieldDelimiter: separator, allowInvalid: false);
        _data = raw;
        for (var i = 1; i < rows.length; i++) {
          if (rows[i].length != rows[i - 1].length) {
            throw InvalidFormatError("Invalid data format");
          }
        }
      } catch (e) {
        throw InvalidFormatError("Invalid data format");
      }
    } else {
      rows = [];
      _data = null;
    }
  }

  List<String> get fields => rows.length > 0 ? rows[0].map((field) => field.toString()).toList() : [];

  String get separator;
}
