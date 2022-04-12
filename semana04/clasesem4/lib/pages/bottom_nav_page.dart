import 'package:clasesem4/pages/tabs/tab_home.dart';
import 'package:clasesem4/pages/tabs/tab_lanzamientos.dart';
import 'package:clasesem4/pages/tabs/tab_naves.dart';
import 'package:clasesem4/pages/tabs/tab_visitantes.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavPage extends StatefulWidget {
  BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  // List<Widget> paginas = [
  //   TabHome(),
  //   TabLanzamientos(),
  //   TabNaves(),
  //   TabVisitantes(),
  // ];

  List paginas = [
    {'pagina': TabHome(), 'texto': 'Home', 'icono': MdiIcons.earth, 'color': 0xFFD80100},
    {'pagina': TabLanzamientos(), 'texto': 'Lanzamientos', 'icono': MdiIcons.rocketLaunch, 'color': 0xFF037470},
    {'pagina': TabNaves(), 'texto': 'Naves', 'icono': MdiIcons.ufoOutline, 'color': 0xFFFF8800},
    {'pagina': TabVisitantes(), 'texto': 'Visitantes', 'icono': MdiIcons.alienOutline, 'color': 0xFF2C0728},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Bottom Nav'),
        backgroundColor: Colors.purple,
      ),
      body: paginas[_currentIndex]['pagina'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: paginas.map((p) {
          return BottomNavigationBarItem(
            label: p['texto'],
            icon: Icon(p['icono']),
            backgroundColor: Color(p['color']),
          );
        }).toList(),
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(MdiIcons.earth),
        //     label: 'Home',
        //     backgroundColor: Color(0xFFD80100),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(MdiIcons.rocketLaunch),
        //     label: 'Lanzamientos',
        //     backgroundColor: Color(0xFF037470),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(MdiIcons.ufoOutline),
        //     label: 'Naves',
        //     backgroundColor: Color(0xFFFF8800),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(MdiIcons.alienOutline),
        //     label: 'Visitantes',
        //     backgroundColor: Color(0xFF2C0728),
        //   ),
        // ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
