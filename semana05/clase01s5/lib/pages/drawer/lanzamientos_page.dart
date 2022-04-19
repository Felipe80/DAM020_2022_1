import 'package:flutter/material.dart';

class LanzamientosPage extends StatelessWidget {
  const LanzamientosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lanzamientos'),
      ),
      body: Center(
          child: Text(
        'Lanzamientos',
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}
