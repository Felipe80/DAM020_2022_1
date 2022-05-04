import 'package:clase1sem6/providers/dpa_provider.dart';
import 'package:flutter/material.dart';

class DpaPage extends StatefulWidget {
  DpaPage({Key? key}) : super(key: key);

  @override
  State<DpaPage> createState() => _DpaPageState();
}

class _DpaPageState extends State<DpaPage> {
  String region = '', provincia = '', comuna = '';

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
                    //return Text('Cargando regiones...');
                    return DropdownButtonFormField<String>(
                      hint: Text('Cargando regiones...'),
                      items: [],
                      onChanged: (valor) {},
                    );
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
                        provincia = '';
                        comuna = '';
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
                  if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                    // return Text('Cargando provincias...');
                    return DropdownButtonFormField<String>(
                      hint: Text('Cargando provincias...'),
                      items: [],
                      onChanged: (valor) {},
                    );
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
                    value: provincia.isEmpty ? null : provincia,
                    onChanged: (nuevaProvincia) {
                      setState(() {
                        provincia = nuevaProvincia.toString();
                        comuna = '';
                      });
                    },
                  );
                },
              ),
            ),

            //comunas
            Container(
              child: FutureBuilder(
                future: DpaProvider().getComunas(region, provincia),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                    //return Text('Cargando comunas');
                    return DropdownButtonFormField<String>(
                      hint: Text('Cargando comunas...'),
                      items: [],
                      onChanged: (valor) {},
                    );
                  }

                  var comunas = snapshot.data;

                  return DropdownButtonFormField<String>(
                    hint: Text('Comunas'),
                    items: comunas.map<DropdownMenuItem<String>>((comuna) {
                      return DropdownMenuItem<String>(
                        child: Text(comuna['nombre']),
                        value: comuna['codigo'],
                      );
                    }).toList(),
                    value: comuna.isEmpty ? null : comuna,
                    onChanged: (nuevaComuna) {
                      setState(() {
                        comuna = nuevaComuna.toString();
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
