import 'dart:convert';
import 'dart:io';

Map<String, dynamic> getJsonFromFile(String fileName) {
  return json.decode(getStringFromFile(fileName));
}

String getStringFromFile(String fileName) {
  return File('test/fixtures/$fileName').readAsStringSync();
}
