import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/pages/login_page.dart';
import 'package:firebase_login/pages/productos_agregar.dart';
import 'package:firebase_login/pages/productos_editar.dart';
import 'package:firebase_login/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/panel_user_email.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.remove('userEmail');

                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => LoginPage(),
                );
                Navigator.pushReplacement(context, route);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          PanelUserEmail(),
          Expanded(
            child: StreamBuilder(
              stream: FirestoreService().productos(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var producto = snapshot.data!.docs[index];

                    return ListTile(
                      leading: Icon(MdiIcons.cube),
                      title: Text('${producto['nombre']}'),
                      subtitle: Text('Stock: ${producto['stock']} Precio:\$${producto['precio']}'),
                      trailing: TextButton(
                        child: Icon(
                          MdiIcons.trashCan,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // print(producto.id);
                          FirestoreService().productosBorrar(producto.id);
                        },
                      ),
                      onLongPress: () {
                        MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) => ProductosEditar(producto.id),
                        );
                        Navigator.push(context, route);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => ProductosAgregar(),
          );
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
