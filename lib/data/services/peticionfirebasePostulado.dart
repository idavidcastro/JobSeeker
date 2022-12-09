import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../domain/controller/controladorAuth.dart';
import '../../domain/models/postulado.dart';

class PeticionesPostulados {
  //static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Controllerauthf controlf = Get.find();
  //String uid = controlf.uid;
  /*
  static Future<void> crearArticulo(Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['idArticulo']);
    }

    catalogo['foto'] = url.toString();

    await _db.collection('Articulos').doc().set(catalogo).catchError((e) {});
    //return true;
  }

  
  static Future<dynamic> cargarfoto(var foto, var idArt) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Articulos");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idArt).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
  }

  static Future<void> actualizarArticulo(
      String id, Map<String, dynamic> catalogo) async {
    await _db.collection('Articulos').doc(id).update(catalogo).catchError((e) {
      log(e);
    });
    //return true;
  }

  static Future<void> eliminarcatalogo(String id) async {
    await _db.collection('Articulos').doc(id).delete().catchError((e) {
      log(e);
    });
    //return true;
  }
  */

  static Future<List<Postulado>> consultarPostulados(String idvacante) async {
    List<Postulado> lista = [];
    await _db
        .collection("Usuarios")
        .doc(controlf.uid)
        .collection('Vacantes')
        .doc(idvacante)
        .collection('Postulados')
        .get()
        .then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data.toString());
        lista.add(Postulado.desdeDoc(doc.data()));
      }
      print('numero de docuemntos');
      print(respuesta.docs.length);
    });

    return lista;
  }
}
