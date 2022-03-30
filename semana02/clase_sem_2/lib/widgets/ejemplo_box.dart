import 'package:flutter/material.dart';

class EjemploBox extends StatelessWidget {
  final String texto;
  final double ancho;
  final double alto;
  final int color;

  const EjemploBox({
    this.texto = '',
    this.ancho = 100,
    this.alto = double.infinity,
    this.color = 0xFFFFFFFF,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.ancho,
      height: this.alto,
      color: Color(this.color),
      child: Text(
        this.texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
