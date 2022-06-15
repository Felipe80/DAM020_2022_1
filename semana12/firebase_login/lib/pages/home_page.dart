import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio Firebase'),
        backgroundColor: Color(0xFF363942),
        leading: Icon(
          MdiIcons.firebase,
          color: Colors.yellow,
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'otra',
                child: Text('Otra opción'),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Text('Salir'),
              ),
            ],
            onSelected: (opcion) async {
              if (opcion == 'logout') {
                await FirebaseAuth.instance.signOut();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => LoginPage(),
                );
                Navigator.pushReplacement(context, route);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
