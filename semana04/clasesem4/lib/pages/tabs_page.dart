import 'package:clasesem4/pages/tabs/tab_home.dart';
import 'package:clasesem4/pages/tabs/tab_lanzamientos.dart';
import 'package:clasesem4/pages/tabs/tab_naves.dart';
import 'package:clasesem4/pages/tabs/tab_visitantes.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ejemplos Tabs'),
            backgroundColor: Color(0xFFC10037),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Home',
                  icon: Icon(MdiIcons.earth),
                ),
                Tab(
                  text: 'Lanzamientos',
                  icon: Icon(MdiIcons.rocketLaunch),
                ),
                Tab(
                  text: 'Naves',
                  icon: Icon(MdiIcons.ufoOutline),
                ),
                Tab(
                  text: 'Visitantes',
                  icon: Icon(MdiIcons.alienOutline),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TabHome(),
              TabLanzamientos(),
              TabNaves(),
              TabVisitantes(),
            ],
          ),
        ),
      ),
    );
  }
}
