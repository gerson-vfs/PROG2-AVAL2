import './data.dart';
import 'dart:convert';
import 'dart:io';

class JsonData implements Data {
  Map<String, dynamic> jsonData=Map<String, dynamic>();
  bool hasData = false;
  
  String get data {
    return jsonEncode(jsonData);
  }

  void set data(String _data){
    jsonData = jsonDecode(_data);
    if(_data != ''){
      hasData = true;
    } else {
      hasData = false;
    }
  }

  List<String> get fields {
    var fieldList = jsonData.keys.toList();
    if(fieldList == null){
      return [];
    }
    return fieldList;
  }
  void load(String fileName){
    final jsonFile = File(fileName).readAsStringSync();
    jsonData = jsonDecode(jsonFile);
  }

  void save(String fileName){
    // Not implemented
  } 

  void clear(){
    jsonData = Map<String, dynamic>();
    hasData = false;
  }
}