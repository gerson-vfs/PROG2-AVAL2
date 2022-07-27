import './lib/jsonData.dart';

void main(){
  var jsonFileName = './exampleFiles/jsonExample.json';
  var jsonData = JsonData();
  jsonData.load(jsonFileName);
  print(jsonData.fields);
}
