import 'package:firebase_login/services/firestore_service.dart';
import 'package:flutter/material.dart';

class ProductosEditar extends StatefulWidget {
  String productoId;
  ProductosEditar(this.productoId, {Key? key}) : super(key: key);

  @override
  State<ProductosEditar> createState() => _ProductosEditarState();
}

class _ProductosEditarState extends State<ProductosEditar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nombreCtrl = TextEditingController();
    TextEditingController stockCtrl = TextEditingController();
    TextEditingController precioCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
        backgroundColor: Color(0xFF363942),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: FutureBuilder(
              future: FirestoreService().getProducto(widget.productoId),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var producto = snapshot.data;
                nombreCtrl.text = producto['nombre'];
                stockCtrl.text = producto['stock'].toString();
                precioCtrl.text = producto['precio'].toString();

                return ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                            'Id Producto:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.productoId),
                        ],
                      ),
                    ),
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
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: Text('Editar Producto'),
                        onPressed: () async {
                          String nombre = nombreCtrl.text.trim();
                          int stock = int.tryParse(stockCtrl.text.trim()) ?? 0;
                          int precio = int.tryParse(precioCtrl.text.trim()) ?? 0;
                          FirestoreService().productosEditar(widget.productoId, nombre, stock, precio);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
