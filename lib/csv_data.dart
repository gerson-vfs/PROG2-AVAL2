import 'dart:io';
import 'package:csv/csv.dart';
import 'delimited_data.dart';

class CSVData extends DelimitedData {
  String get separator => ',';
}