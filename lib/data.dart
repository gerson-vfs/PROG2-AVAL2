import 'dart:io';
import './errors/file_not_found_error.dart';
import './errors/read_file_error.dart';
import './errors/write_file_error.dart';
import './errors/no_data_error.dart';

abstract class Data {
  void load(String fileName) {
    final file = new File(fileName);
    String raw;

    if (!file.existsSync()) {
      throw FileNotFoundError(file.path);
    }

    if (hasData) {
      clear();
    }

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
      final outFile = new File(fileName);

      outFile.createSync(recursive: true);
      outFile.writeAsStringSync(data);
    } catch (e) {
      throw WriteFileError(e.toString());
    }
  }

  void clear() {
    data = null;
  }

  bool get hasData {
    return data != null;
  }

  String? get data;
  void set data(String? _data);

  List<String> get fields;
}
