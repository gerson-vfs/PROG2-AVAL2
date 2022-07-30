import 'lib/json_data.dart';
import 'lib/xml_data.dart';

void main() {
  var jsonFileName = './example_files/json_example_case2.json';
  var jSONData = JSONData();
  jSONData.load(jsonFileName);
  print(jSONData.data);
  print(jSONData.fields);
  jSONData.save('./example_files/json_example_out.json');
  jSONData.clear();
  print(jSONData.hasData);

  print("------------------------------------------------");
  var xmlFileName = './example_files/xml_example.xml';
  var xmlData = XMLData();
  print(xmlData.hasData);
  xmlData.load(xmlFileName);
  print(xmlData.hasData);
  print(xmlData.data);
  xmlData.data = null;
  print(xmlData.fields);
  xmlData.save('./example_files/xml_example_out.xml');
  xmlData.clear();
  print(xmlData.hasData);
}
