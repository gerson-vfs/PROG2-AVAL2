import 'package:xml/xml.dart';
import './data.dart';
import './errors/invalid_format_error.dart';

class XMLData extends Data {
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
      data = null;
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
}
