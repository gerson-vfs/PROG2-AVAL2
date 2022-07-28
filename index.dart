import './lib/jsonData.dart';

void main(){
  var jsonFileName = './exampleFiles/jsonExample.json';
  var jSONData = JSONData();
  jSONData.load(jsonFileName);
  print(jSONData.hasData);
  print(jSONData.fields);
  jSONData.save('./exampleFiles/jsonExamplen.json');
  jSONData.clear();
  print(jSONData.hasData);
}
