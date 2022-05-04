import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DogProvider {
  final String apiURL = 'https://dog.ceo/api/breeds/image/random';

  Future<LinkedHashMap<String, dynamic>> getPerro() async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }
}
