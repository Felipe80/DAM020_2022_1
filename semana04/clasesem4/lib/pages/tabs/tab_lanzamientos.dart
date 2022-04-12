import 'package:flutter/material.dart';

class TabLanzamientos extends StatelessWidget {
  const TabLanzamientos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'LANZAMIENTOS',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
