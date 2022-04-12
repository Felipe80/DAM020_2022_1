import 'package:flutter/material.dart';

class TabVisitantes extends StatelessWidget {
  const TabVisitantes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Visitantes',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
