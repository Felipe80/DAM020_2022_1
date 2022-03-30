import 'package:clase_sem_2/widgets/ejemplo_box.dart';
import 'package:flutter/material.dart';

class Ejemplo3 extends StatefulWidget {
  const Ejemplo3({Key? key}) : super(key: key);

  @override
  State<Ejemplo3> createState() => _Ejemplo3State();
}

class _Ejemplo3State extends State<Ejemplo3> {
  int stackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semana 2'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.blue.shade50,
            height: 200,
            width: double.infinity,
            child: IndexedStack(
              index: stackIndex,
              children: [
                EjemploBox(texto: '1', color: 0xFFFF0000, ancho: 100, alto: 100),
                EjemploBox(texto: '2', color: 0xFF0000FF, ancho: 100, alto: 100),
              ],
            ),
          ),
          Container(
            color: Colors.green.shade50,
            height: 70,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Box 1'),
                  onPressed: () {
                    setState(() {
                      stackIndex = 0;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Box 2'),
                  onPressed: () {
                    setState(() {
                      stackIndex = 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
