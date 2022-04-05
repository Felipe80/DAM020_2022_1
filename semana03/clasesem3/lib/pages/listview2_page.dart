import 'package:clasesem3/pages/profe_info_page.dart';
import 'package:flutter/material.dart';

class Listview2Page extends StatelessWidget {
  final estudiantes = [
    {'nombre': 'Dagoberto Cabrera', 'curso': 'Programación', 'edad': 67},
    {'nombre': 'Gabriel Jara', 'curso': 'Estadística Aplicada', 'edad': 40},
    {'nombre': 'Ricardo Cahe', 'curso': 'Análisis de Sistemas', 'edad': 55},
    {'nombre': 'Pamela Gatica', 'curso': 'Lenguajes de Programación', 'edad': 38},
    {'nombre': 'Oscar Carrasco', 'curso': 'Estructura de datos', 'edad': 45},
    {'nombre': 'Ana Rojas', 'curso': 'Programación Orientada a Objetos', 'edad': 47},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Lista 2'),
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
              children: estudiantes.map((e) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                          return ProfeInfoPage();
                        });
                        Navigator.push(context, route);
                      },
                      leading: Icon(
                        Icons.account_circle,
                        color: int.parse(e['edad']!.toString()) >= 60 ? Colors.red : Colors.green,
                      ),
                      trailing: Container(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(e['edad'].toString()),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                      title: Text(e['nombre'].toString()),
                      subtitle: Text(e['curso'].toString()),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.blue.shade300,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
