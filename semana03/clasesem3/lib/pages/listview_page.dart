import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {
  const ListviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Lista'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.blue.shade50,
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(5),
            child: Text(
              'Lista de estudiantes',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text('Dagoberto Cabrera'),
                  subtitle: Text('Programación'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text('Gabriel Jara'),
                  subtitle: Text('Estadística Aplicada'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text('Ricardo Cahe'),
                  subtitle: Text('Análisis de Sistemas'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text('Pamela Gatica'),
                  subtitle: Text('Estructura de datos'),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
