import 'dart:convert';
import 'dart:io';

Map<String, dynamic> getJsonFromFile(String fileName) {
  return json.decode(File('test/fixtures/$fileName').readAsStringSync());
}
