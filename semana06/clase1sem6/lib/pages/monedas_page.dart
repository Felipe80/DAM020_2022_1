import 'package:clase1sem6/providers/monedas_provider.dart';
import 'package:flutter/material.dart';

class MonedasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MonedasProvider provider = new MonedasProvider();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Monedas'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: Text(
              'Lista de monedas API',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: provider.getMonedas(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      'Esperando respuesta...',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Data recibida :)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
