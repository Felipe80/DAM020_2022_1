import 'dart:convert';

import 'package:http/http.dart' as http;

class DpaProvider {
  final String apiURL = 'https://apis.digital.gob.cl/dpa';

  Future<List<dynamic>> getRegiones() async {
    var url = Uri.parse('$apiURL/regiones');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getProvincias(String region) async {
    if (region.isEmpty) {
      return [];
    }

    var url = Uri.parse('$apiURL/regiones/$region/provincias');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}
