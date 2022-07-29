import './data.dart';
import 'dart:convert';
import 'dart:io';

class JSONData implements Data {
  dynamic jsonData = [];

  String? get data {
    return jsonData.isNotEmpty ? jsonEncode(jsonData) : null;
  }

  void set data(String? _data) {
    jsonData = jsonDecode(_data ?? '[]');

    if (jsonData is Map) {
      jsonData = [jsonData];
    }
  }

  bool get hasData {
    return data != null;
  }

  List<String> get fields {
    // --- Errors ---
    // // Fields not found or with problems
    List<String> fieldList = hasData ? jsonData[0].keys.toList() : [];
    print(fieldList);
    return fieldList;
  }

  void load(String fileName) {
    // --- Errors ---
    // Format Invalid
    // File not found
    final jsonFile = File(fileName).readAsStringSync();
    data = jsonFile;
  }

  void save(String fileName) {
    // --- Errors ---
    // No could be saved
    // No could write inside file

    final jsonContent = data;
    final outFile = File(fileName);
    outFile.createSync(recursive: true);
    outFile.writeAsStringSync(jsonContent ?? '');
  }

  void clear() {
    data = null;
  }
}
