import 'package:clase1sem6/providers/dpa_provider.dart';
import 'package:flutter/material.dart';

class DpaPage extends StatefulWidget {
  DpaPage({Key? key}) : super(key: key);

  @override
  State<DpaPage> createState() => _DpaPageState();
}

class _DpaPageState extends State<DpaPage> {
  String region = '', provincia = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo DPA'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            //regiones
            Container(
              child: FutureBuilder(
                future: DpaProvider().getRegiones(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Cargando regiones...');
                  }

                  var regiones = snapshot.data;

                  return DropdownButtonFormField<String>(
                    hint: Text('Región'),
                    items: regiones.map<DropdownMenuItem<String>>((region) {
                      return DropdownMenuItem<String>(
                        child: Text(region['nombre']),
                        value: region['codigo'],
                      );
                    }).toList(),
                    value: region.isEmpty ? null : region,
                    onChanged: (nuevaRegion) {
                      setState(() {
                        region = nuevaRegion.toString();
                      });
                    },
                  );
                },
              ),
            ),

            //provincias
            Container(
              child: FutureBuilder(
                future: DpaProvider().getProvincias(region),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Cargando provincias...');
                  }

                  var provincias = snapshot.data;
                  return DropdownButtonFormField<String>(
                    hint: Text('Provincias'),
                    items: provincias.map<DropdownMenuItem<String>>((provincia) {
                      return DropdownMenuItem<String>(
                        child: Text(provincia['nombre']),
                        value: provincia['codigo'],
                      );
                    }).toList(),
                    value: null,
                    onChanged: (nuevaProvincia) {
                      setState(() {
                        provincia = nuevaProvincia.toString();
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
