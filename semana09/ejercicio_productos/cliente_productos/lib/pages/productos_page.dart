import 'package:cliente_productos/pages/productos_agregar_page.dart';
import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductosPage extends StatefulWidget {
  @override
  State<ProductosPage> createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final fPrecio = NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ProductosProvider().getProductos(),
                builder: (context, AsyncSnapshot snap) {
                  if (!snap.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: snap.data.length,
                    itemBuilder: (context, index) {
                      var prod = snap.data[index];
                      return ListTile(
                        leading: Icon(MdiIcons.cube),
                        title: Text(prod['nombre']),
                        subtitle: Text('Stock: ${prod['stock']}'),
                        trailing: Text('\$${fPrecio.format(prod['precio'])}'),
                      );
                    },
                  );
                },
              ),
            ),

            //boton agregar
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Agregar Producto'),
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(builder: (context) {
                    return ProductosAgregarPage();
                  });

                  Navigator.push(context, route).then((value) {
                    print('ACTUALIZAR PAGINA');
                    setState(() {});
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
