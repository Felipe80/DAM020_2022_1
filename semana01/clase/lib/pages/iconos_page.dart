import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconosPage extends StatelessWidget {
  const IconosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iconos'),
      ),
      body: Column(
        children: [
          Text('Iconos',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.android,size: 60,color: Colors.purple,),
              Icon(Icons.rocket,size:60,color: Colors.green,),
              Icon(MdiIcons.spaceInvaders,size:60,color: Colors.red,),
            ],
          ),
          ElevatedButton(
            child: Text('Volver'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}