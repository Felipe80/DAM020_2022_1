import 'package:dog_api/providers/dog_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(MdiIcons.dogSide),
        title: Text('Dog API'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              //foto
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: FutureBuilder(
                  future: DogProvider().getPerro(),
                  builder: (context, AsyncSnapshot snap) {
                    if (!snap.hasData || snap.connectionState == ConnectionState.waiting) {
                      return Text('Cargando...');
                    }
                    return Image(
                      height: 300,
                      image: NetworkImage(snap.data['message']),
                    );
                  },
                ),
              ),
              //boton
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Otro perro! ', style: TextStyle(fontSize: 20)),
                      Icon(MdiIcons.reload, color: Colors.white)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.grey.shade800),
                  onPressed: () {
                    setState(() {});
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
