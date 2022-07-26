import 'lib/implementations/jsonData.dart';


void main(){
  var jsonFileName = './exampleFiles/jsonExample.json';
  var jsonData = JsonData();
  jsonData.load(jsonFileName);
  print(jsonData.fields);
}


// TODO's:
// 