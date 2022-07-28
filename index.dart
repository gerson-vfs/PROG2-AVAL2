import './lib/jsonData.dart';

void main(){
  var jsonFileName = './exampleFiles/jsonExample.json';
  var jsonData = JsonData();
  jsonData.load(jsonFileName);
  print(jsonData.hasData);
  print(jsonData.fields);
  jsonData.save('./exampleFiles/jsonExamplen.json');
  jsonData.clear();
  print(jsonData.hasData);
}
