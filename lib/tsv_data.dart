import 'dart:io';
import 'package:csv/csv.dart';
import 'delimited_data.dart';

class TSVData extends DelimitedData {
  String get separator => '\t';
}