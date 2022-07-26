abstract class Data {
  void load(String fileName);
  void save(String fileName); 
  void clear();

  bool hasData=false;
  String get data;
  void set data(String _data);

  List<String> get fields;
}

abstract class DelimitedData extends Data {
  String get separator;
}