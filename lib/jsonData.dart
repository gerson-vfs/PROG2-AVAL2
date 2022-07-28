import './data.dart';
import 'dart:convert';
import 'dart:io';

class JsonData implements Data {
  Map<String, dynamic> jsonData = Map<String, dynamic>();
  bool hasData = false;

  String get data {
    return jsonEncode(jsonData);
  }

  void set data(String _data) {
    if (_data != '') {
      jsonData = jsonDecode(_data)[0];
      hasData = true;
    } else {
      jsonData = Map<String, dynamic>();
      hasData = false;
    }
  }

  List<String> get fields {
    var fieldList = jsonData.keys.toList();
    if (fieldList.length == 0) {
      return [];
    }

    return fieldList;
  }

  void load(String fileName) {
    final jsonFile = File(fileName).readAsStringSync();
    this.data = jsonFile;
  }

  void save(String fileName) {
    final jsonContent = this.data;
    final outFile = File(fileName);
    outFile.createSync(recursive: true);
    outFile.writeAsStringSync(jsonContent);
  }

  void clear() {
    this.data = '';
  }
}
