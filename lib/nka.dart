import 'dart:convert';

// TODO: Add typedef or whatever is needed to read from a file, JsonDecode is in place to read the json file when we start using one
typedef dynamic JsonDecode(String source);
JsonDecode get jsonDecode => json.decode;

Future<double> _getIncome(JsonDecode jsonDecode) async {
  print('get');
  return 100000.0;
}

Future<double> getIncome() => _getIncome(jsonDecode);