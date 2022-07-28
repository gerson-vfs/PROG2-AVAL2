import './data.dart';
import 'dart:convert';
import 'dart:io';

class JSONData implements Data {
  Map<String, dynamic> jsonData = Map<String, dynamic>();

  String get data {
    return jsonEncode(jsonData);
  }

  void set data(String _data) {
    if (_data != null) {
      jsonData = jsonDecode(_data)[0];
    } else {
      jsonData = Map<String, dynamic>();
    }
  }

  bool get hasData {
    return !jsonData.isEmpty;
  }
  
  List<String> get fields {
    // Fields not found or with problems
    var fieldList = jsonData.keys.toList();
    if (fieldList.length == 0) {
      return [];
    }

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
    outFile.writeAsStringSync(jsonContent);
  }

  void clear() {
    data = null;
  }
}
