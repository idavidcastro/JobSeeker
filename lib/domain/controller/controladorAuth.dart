import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Controllerauthf extends GetxController {
  final FirebaseAuth authf = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarior = "Sin registro".obs;
  final Rx<dynamic> _tiposuer = "".obs;
  final Rx<dynamic> _nombre = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;
  String get tiposuerREAL => _tiposuer.value;

  Future<void> registrarEmail(
      String email, String passwd, String typeuser) async {
    try {
      UserCredential usuario = await authf.createUserWithEmailAndPassword(
          email: email, password: passwd);

      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;

      await usuario.user?.updateDisplayName(typeuser);
      if (kDebugMode) {
        print(usuario);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
  }

  Future<void> ingresarEmail(String email, String passwd) async {
    try {
      UserCredential usuario = await authf.signInWithEmailAndPassword(
          email: email, password: passwd);

      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
      _tiposuer.value = usuario.user!.displayName;

      if (kDebugMode) {
        print(usuario.user!.displayName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('El usuario no existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      }
    }
  }
}
