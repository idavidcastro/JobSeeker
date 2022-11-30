// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/domain/controller/controllerfirebase.dart';

import '../../domain/controller/controladorAuth.dart';
import '../../domain/models/usuario.dart';
import 'login.dart';

class AdicionarUsuario extends StatefulWidget {
  const AdicionarUsuario({Globalkey});
  @override
  State<AdicionarUsuario> createState() => _AdicionarUsuarioState();
}

class _AdicionarUsuarioState extends State<AdicionarUsuario> {
  List<String> list = ['Empleado', 'Empleador'];
  String? valueChoose = 'Empleado';

  final List<Usuario> _usuarioadd = [];
  TextEditingController controlcontrasena = TextEditingController();
  TextEditingController controltipousuario = TextEditingController();
  TextEditingController controlcorreoelectronico = TextEditingController();
  Controllerauthf controlf = Get.find();
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('NUEVO USUARIO'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _titulo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
                child: DropdownButton(
                  value: valueChoose,
                  onChanged: (String? value) {
                    setState(() {
                      valueChoose = value;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextFormField(
                  controller: controlcorreoelectronico,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Correo electronico',
                      icon: const Icon(Icons.message),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlcorreoelectronico.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controlcontrasena,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Contraseña',
                      icon: const Icon(Icons.lock),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlcontrasena.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    if (controlcontrasena.text.isNotEmpty &&
                        controlcorreoelectronico.text.isNotEmpty) {
                      controlf
                          .registrarEmail(controlcorreoelectronico.text,
                              controlcontrasena.text, valueChoose.toString())
                          .then((value) {
                        if (controlf.emailf != 'Sin registro') {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Nuevo Usuario'),
                                    content:
                                        const Text('Usuario nuevo registrado'),
                                    actions: <Widget>[
                                      MaterialButton(
                                        child: const Text('Ok'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ));
                          controlcorreoelectronico.clear();
                          controlcontrasena.clear();
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'El usuario ya está registrado'),
                                    actions: <Widget>[
                                      MaterialButton(
                                        child: const Text('Ok'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ));
                        }
                      }).catchError((onError) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'El usuario ya está registrado'),
                                  actions: <Widget>[
                                    MaterialButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ));
                      });

                      /*
                      registrarUsuario(
                          valueChoose.toString().trim(),
                          controlcorreoelectronico.text.trim(),
                          controlcontrasena.text.trim());
                      controlcontrasena.clear();
                      controlcorreoelectronico.clear();*/
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  highlightElevation: 20.0,
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: const Text(
                    'Registrar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _contrasena() {
    var controlcontrasena;
    return TextField(
      onChanged: controlcontrasena,
      controller: controlcontrasena,
    );
  }

  Widget _titulo() {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        "Registrarse",
        style: TextStyle(
            color: Colors.black, fontSize: 50.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  registrarUsuario(String tipousuario, String correo, String passwd) async {
    bool encontrar = false;
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get('correo') == correo) {
            encontrar = true;
          }
        }
        if (encontrar == true) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('El usuario ya está registrado'),
                    actions: <Widget>[
                      MaterialButton(
                        child: const Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ));
        } else {
          try {
            String id = FirebaseFirestore.instance.collection('Users').doc().id;
            print(id);
            await firebase.collection('Users').doc(id).set({
              "tipousuario": tipousuario,
              "correo": correo,
              "contraseña": passwd,
              "id": id,
            });
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Nuevo Usuario'),
                      content: const Text('Usuario nuevo registrado'),
                      actions: <Widget>[
                        MaterialButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ));
          } catch (e) {
            if (kDebugMode) {
              print('Error...' + e.toString());
            }
          }
        }
      }
    } catch (e) {}
  }
}
