import 'dart:io';
import 'package:xml/xml.dart';
import './data.dart';
import './errors/no_data_error.dart';
import './errors/file_not_found_error.dart';
import './errors/invalid_format_error.dart';
import './errors/read_file_error.dart';
import './errors/write_file_error.dart';

class XMLData implements Data {
  List<Map<String, dynamic>>? _mapXML = null;

  String? get data {
    final mapXML = _mapXML;

    if (mapXML == null) {
      return null;
    }

    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element('root', nest: () {
      for (final map in mapXML) {
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
      return _mapXML = null;
    }

    XmlDocument document;

    try {
      document = XmlDocument.parse(raw);
    } catch (e) {
      throw InvalidFormatError("Invalid XML data format");
    }

    final root = document.getElement("root");
    if (root == null) {
      throw InvalidFormatError("Invalid XML data format");
    }

    final elements = root.findElements("element");
    if (elements.isEmpty) {
      throw InvalidFormatError("Invalid XML data format");
    }

    final List<Map<String, dynamic>> result = [];
    for (var el in elements) {
      Map<String, dynamic> data = {};
      for (var el in el.childElements) {
        data[el.name.toString()] = el.text;
      }
      result.add(data);
    }

    _mapXML = result;
  }

  bool get hasData => data != null;

  void clear() {
    data = null;
  }

  List<String> get fields {
    final mapXML = _mapXML;
    Set<String> keys = {};

    if (mapXML == null) {
      return keys.toList();
    }

    for (var el in mapXML) {
      for (var key in el.keys) {
        keys.add(key);
      }
    }

    return keys.toList();
  }

  void load(String fileName) {
    final file = new File(fileName);

    if (!file.existsSync()) {
      throw FileNotFoundError(file.path);
    }

    String raw;

    try {
      raw = file.readAsStringSync();
    } catch (e) {
      throw ReadFileError(e.toString());
    }

    data = raw;
  }

  void save(String fileName) {
    final data = this.data;
    if (data == null) {
      throw NoDataError();
    }

    try {
      final file = new File(fileName);
      file.writeAsStringSync(data);
    } catch (e) {
      throw WriteFileError(e.toString());
    }
  }
}
