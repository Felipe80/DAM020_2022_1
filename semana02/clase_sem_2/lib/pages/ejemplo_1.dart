import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/ejemplo_box.dart';

class Ejemplo1 extends StatelessWidget {
  const Ejemplo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(MdiIcons.android),
        title: Text('Semana 2'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.blue.shade50,
            height: 200,
            child: Row(
              children: [
                EjemploBox(texto: '1', color: 0xFFCA0135, ancho: 70),
                Expanded(
                  flex: 2,
                  child: EjemploBox(texto: '2', color: 0xFF1E6096, ancho: 70),
                ),
                EjemploBox(texto: '3', color: 0xFF39A99E, ancho: 70),
                Expanded(child: EjemploBox(texto: '4', color: 0xFF843169, ancho: 70)),
              ],
            ),
          ),
          Container(
            color: Colors.blue.shade50,
            height: 200,
            child: Row(
              children: [
                EjemploBox(texto: '1', color: 0xFFCA0135, ancho: 70),
                Spacer(
                  flex: 2,
                ),
                EjemploBox(texto: '2', color: 0xFF1E6096, ancho: 70),
                EjemploBox(texto: '3', color: 0xFF39A99E, ancho: 70),
                Spacer(),
                EjemploBox(texto: '4', color: 0xFF843169, ancho: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
