import './lib/jsonData.dart';

void main(){
  var jsonFileName = './exampleFiles/jsonExample.json';
  var jsonData = JsonData();
  print(jsonData.data);
  jsonData.load(jsonFileName);
  print(jsonData.fields);
  jsonData.save('./exampleFiles/jsonExamplen.json');
  jsonData.clear();
}
