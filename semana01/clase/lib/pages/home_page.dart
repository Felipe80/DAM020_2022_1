import 'package:clase01/pages/iconos_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final estiloTexto1 = TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera App'),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFD3D6AD),
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Uno',style: TextStyle(fontSize: 32,color: Colors.green),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Dos',style: TextStyle(fontSize: 32,color: Colors.blue),),
                    Text('Tres',style: TextStyle(fontSize: 32,color: Colors.purple),),
                  ],
                ),         
                Text('Cuatro',style: estiloTexto1,),
                Text('Cinco',style: estiloTexto1,),
              ],
            ),
          ),
          ElevatedButton(
            child: Text('Página Iconos'),
            onPressed: (){
              MaterialPageRoute route = new MaterialPageRoute(
                builder: (context){
                  return IconosPage();
                }
              );
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}