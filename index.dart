import 'lib/json_data.dart';

void main(){
  var jsonFileName = './example_files/json_example.json';
  var jSONData = JSONData();
  jSONData.load(jsonFileName);
  print(jSONData.hasData);
  print(jSONData.fields);
  jSONData.save('./example_files/json_example_out.json');
  jSONData.clear();
  print(jSONData.hasData);
}
