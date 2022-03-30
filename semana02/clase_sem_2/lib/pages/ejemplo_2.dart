import 'package:clase_sem_2/widgets/ejemplo_box.dart';
import 'package:flutter/material.dart';

class Ejemplo2 extends StatelessWidget {
  const Ejemplo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Semana 2'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              'Hola Mundo',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.green.shade50,
            height: 200,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                EjemploBox(texto: 'A', color: 0xFFCA0135, ancho: 150, alto: 150),
                Positioned(
                  bottom: -50,
                  child: EjemploBox(texto: 'B', color: 0xFF0000FF, ancho: 100, alto: 100),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
