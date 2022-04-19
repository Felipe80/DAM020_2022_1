import 'package:flutter/material.dart';

class NavesPage extends StatelessWidget {
  const NavesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Naves'),
      ),
      body: Center(
          child: Text(
        'Naves',
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}
