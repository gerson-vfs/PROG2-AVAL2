import 'dart:io';
import 'package:xml/xml.dart';
import 'data.dart';

class XMLData implements Data {
  String? _rawXML = null;
  List<Map<String, dynamic>>? mapXML = null;

  String? get data => _rawXML;

  void set data(String? raw) {
    if (raw == null) {
      throw Exception("Invalid XML data");
    }

    final document = XmlDocument.parse(raw);

    final root = document.getElement("root");
    if (root == null) {
      throw Exception("Invalid XML data");
    }

    final elements = root.findElements("element");
    if (elements.isEmpty) {
      throw Exception("Invalid XML data");
    }

    final List<Map<String, dynamic>> result = [];
    for (var el in elements) {
      Map<String, dynamic> data = {};
      for (var el in el.childElements) {
        data[el.name.toString()] = el.text;
      }
      result.add(data);
    }

    mapXML = result;
    _rawXML = raw;
  }

  bool get hasData => data != null;

  void clear() {
    data = null;
  }

  List<String> get fields {
    Set<String> keys = {};

    if (mapXML == null) {
      return keys.toList();
    }

    for (var el in mapXML!) {
      for (var key in el.keys) {
        keys.add(key);
      }
    }

    return keys.toList();
  }

  void load(String fileName) {
    final file = new File(fileName);
    try {
      final raw = file.readAsStringSync();
      data = raw;
    } catch (e) {
      throw e; // TODO
    }
  }

  void save(String fileName) {}
}
