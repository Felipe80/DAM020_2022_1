import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/game_card.dart';

class HomePage extends StatelessWidget {
  final juegos = [
    {'imagen': 'lego_jurassic_world.jpg', 'titulo': 'Lego Jurassic World', 'precio': '40.000'},
    {'imagen': 'mario_kart_8_deluxe.jpg', 'titulo': 'Mario Kart 8 Deluxe', 'precio': '55.000'},
    {'imagen': 'mario_maker_2.jpg', 'titulo': 'Mario Maker 2', 'precio': '49.000'},
    {'imagen': 'mario_odyssey.jpg', 'titulo': 'Mario Odyssey', 'precio': '42.000'},
    {'imagen': 'mario_u_deluxe.jpg', 'titulo': 'Mario U Deluxe', 'precio': '50.000'},
    {'imagen': 'sonic_forces.jpg', 'titulo': 'Sonic Forces', 'precio': '38.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semana 3'),
        leading: Icon(FontAwesomeIcons.gamepad),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: juegos.map((juego) {
          return GameCard(
            imagen: juego['imagen'].toString(),
            titulo: juego['titulo'].toString(),
            precio: juego['precio'].toString(),
          );
        }).toList(),
      ),
    );
  }
}
