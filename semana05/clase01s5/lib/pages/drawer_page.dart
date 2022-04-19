import 'package:clase01s5/pages/drawer/lanzamientos_page.dart';
import 'package:clase01s5/pages/drawer/naves_page.dart';
import 'package:clase01s5/pages/drawer/visitantes_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Drawer'),
      ),
      body: Center(
        child: Text('Clase 1 semana 05'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/user.jpg'),
                      ),
                      border: Border.all(
                        color: Color(0xFFC30033),
                        width: 2.0,
                      ),
                    ),
                    // child: Image(
                    //   width: 100,
                    //   height: 100,
                    //   image: AssetImage('assets/images/user.jpg'),
                    // ),
                  ),
                  Text(
                    'Celeste Alten',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Lanzamientos'),
              leading: Icon(
                MdiIcons.rocketLaunchOutline,
                color: Color(0xFFC30033),
              ),
              onTap: () => navegar(context, 0),
            ),
            Divider(
              thickness: 0.7,
              color: Color(0x66C30033),
            ),
            ListTile(
              title: Text('Naves'),
              leading: Icon(
                MdiIcons.ufoOutline,
                color: Color(0xFFC30033),
              ),
              onTap: () => navegar(context, 1),
            ),
            Divider(
              thickness: 0.7,
              color: Color(0x66C30033),
            ),
            ListTile(
              title: Text('Visitantes'),
              leading: Icon(
                MdiIcons.alienOutline,
                color: Color(0xFFC30033),
              ),
              onTap: () => navegar(context, 2),
            ),
            Divider(
              thickness: 0.7,
              color: Color(0x66C30033),
            ),
            ListTile(
              title: Text('Cerrar'),
              leading: Icon(
                MdiIcons.arrowLeftBoldCircle,
                color: Color(0xFFC30033),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Divider(
              thickness: 0.7,
              color: Color(0x66C30033),
            ),
          ],
        ),
      ),
    );
  }

  void navegar(BuildContext context, int pagina) {
    List paginas = [
      LanzamientosPage(),
      NavesPage(),
      VisitantesPage(),
    ];

    Navigator.pop(context);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => paginas[pagina],
    );

    // MaterialPageRoute route = MaterialPageRoute(
    //   builder: (context) {
    //     return paginas[pagina];
    //   },
    // );

    Navigator.push(context, route);
  }
}
