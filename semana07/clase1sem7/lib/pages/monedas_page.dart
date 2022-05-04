import 'package:clase1sem6/providers/monedas_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MonedasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MonedasProvider provider = new MonedasProvider();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Monedas'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: Text(
              'Lista de monedas API',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: provider.getMonedas(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  separatorBuilder: ((_, __) => Divider()),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var moneda = snapshot.data[index];
                    return ListTile(
                      leading: Icon(MdiIcons.cash),
                      title: Text(moneda['Nombre']),
                      subtitle: Text(moneda['Codigo']),
                      trailing: Text('${moneda['Valor']} CLP'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
