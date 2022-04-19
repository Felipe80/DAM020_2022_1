import 'package:flutter/material.dart';

class VisitantesPage extends StatelessWidget {
  const VisitantesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitantes'),
      ),
      body: Center(
          child: Text(
        'Visitantes',
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}
