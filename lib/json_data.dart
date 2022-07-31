import 'dart:convert';
import './data.dart';
import './errors/invalid_format_error.dart';

class JSONData extends Data {
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
}
