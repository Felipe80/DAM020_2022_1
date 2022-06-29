import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  //obtener todos los productos
  Stream<QuerySnapshot> productos() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    int limite = 5;
    return FirebaseFirestore.instance.collection('productos').where('stock', isLessThan: limite).snapshots();
  }

  //agregar productos
  Future productosAgregar(String nombre, int stock, int precio) {
    return FirebaseFirestore.instance.collection('productos').doc().set({
      'nombre': nombre,
      'stock': stock,
      'precio': precio,
    });
  }

  //borrar producto
  Future productosBorrar(String productoId) {
    return FirebaseFirestore.instance.collection('productos').doc(productoId).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getProducto(String productoId) async {
    return await FirebaseFirestore.instance.collection('productos').doc(productoId).get();
    // print(prod['nombre']);
  }

  Future productosEditar(String productoId, String nombre, int stock, int precio) {
    return FirebaseFirestore.instance.collection('productos').doc(productoId).update({
      'nombre': nombre,
      'stock': stock,
      'precio': precio,
    });
  }
}
