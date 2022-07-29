abstract class Data {
  void load(String fileName);
  void save(String fileName);
  void clear();

  bool get hasData;

  String? get data;
  void set data(String? _data);

  List<String> get fields;
}
