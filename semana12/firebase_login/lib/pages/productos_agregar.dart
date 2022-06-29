import 'package:firebase_login/services/firestore_service.dart';
import 'package:flutter/material.dart';

class ProductosAgregar extends StatefulWidget {
  ProductosAgregar({Key? key}) : super(key: key);

  @override
  State<ProductosAgregar> createState() => _ProductosAgregarState();
}

class _ProductosAgregarState extends State<ProductosAgregar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nombreCtrl = TextEditingController();
    TextEditingController stockCtrl = TextEditingController();
    TextEditingController precioCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
        backgroundColor: Color(0xFF363942),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: [
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                  labelText: 'Nombre Producto',
                ),
              ),
              TextFormField(
                controller: stockCtrl,
                decoration: InputDecoration(
                  labelText: 'Stock',
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: precioCtrl,
                decoration: InputDecoration(
                  labelText: 'Precio',
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Agregar Producto'),
                  onPressed: () {
                    String nombre = nombreCtrl.text.trim();
                    int stock = int.tryParse(stockCtrl.text.trim()) ?? 0;
                    int precio = int.tryParse(precioCtrl.text.trim()) ?? 0;
                    FirestoreService().productosAgregar(nombre, stock, precio);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
