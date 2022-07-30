import 'dart:io';
import 'package:xml/xml.dart';
import 'data.dart';

class XMLData implements Data {
  List<Map<String, dynamic>>? mapXML = null;

  String? get data {
    if (mapXML == null) {
      return null;
    }

    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element('root', nest: () {
      for (final map in mapXML!) {
        builder.element('element', nest: () {
          for (final key in map.keys) {
            builder.element(key, nest: () {
              builder.text(map[key]);
            });
          }
        });
      }
    });

    final document = builder.buildDocument();
    return document.toString();
  }

  void set data(String? raw) {
    if (raw == null) {
      throw Exception("Invalid XML data1");
    }

    final document = XmlDocument.parse(raw);

    final root = document.getElement("root");
    if (root == null) {
      throw Exception("Invalid XML data2");
    }

    final elements = root.findElements("element");
    if (elements.isEmpty) {
      throw Exception("Invalid XML data3");
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
  }

  bool get hasData => data != null;

  void clear() {
    mapXML = null;
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

  void save(String fileName) {
    if (data == null) {
      throw Exception("No data to save");
    }

    final file = new File(fileName);
    try {
      file.writeAsStringSync(data!);
    } catch (e) {
      throw e; // TODO
    }
  }
}
