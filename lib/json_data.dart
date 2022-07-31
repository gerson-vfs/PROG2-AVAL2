import 'dart:convert';
import 'dart:io';
import './data.dart';
import './errors/no_data_error.dart';
import './errors/file_not_found_error.dart';
import './errors/invalid_format_error.dart';
import './errors/read_file_error.dart';
import './errors/write_file_error.dart';

class JSONData implements Data {
  dynamic jsonData = [];

  String? get data {
    return jsonData.isNotEmpty ? jsonEncode(jsonData) : null;
  }

  void set data(String? _data) {
    if (_data != null) {
      try {
        jsonData = jsonDecode(_data);

        if (jsonData is Map) {
          throw InvalidFormatError("Invalid JSON data format");
        }
      } catch (e) {
        throw InvalidFormatError("Invalid JSON data format");
      }
    } else {
      jsonData = [];
    }
  }

  bool get hasData {
    return data != null;
  }

  List<String> get fields {
    Set<String> keys = {};

    if (jsonData.isEmpty) {
      return keys.toList();
    }

    for (var el in jsonData) {
      for (var key in el.keys) {
        keys.add(key);
      }
    }

    return keys.toList();
  }

  void load(String fileName) {
    final file = new File(fileName);
    String raw;

    if (hasData) {
      clear();
    }

    if (!file.existsSync()) {
      throw FileNotFoundError(file.path);
    }

    try {
      raw = file.readAsStringSync();
    } catch (e) {
      throw ReadFileError(e.toString());
    }
    
    data = raw;
  }

  void save(String fileName) {
    final jsonContent = data;

    if (jsonContent == null) {
      throw NoDataError();
    }

    try {
      final file = new File(fileName);
      file.writeAsStringSync(jsonContent);
    } catch (e) {
      throw WriteFileError(e.toString());
    }
  }

  void clear() {
    data = null;
  }
}
