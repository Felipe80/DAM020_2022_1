import 'dart:convert';

import 'package:http/http.dart' as http;

class MonedasProvider {
  final String apiURL = 'https://api.gael.cloud/general/public/monedas';

  Future<List<dynamic>> getMonedas() async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.get(url);
    print('getmonedas3');

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}
