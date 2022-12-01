// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  List<String> listCiudades = [
    'Valledupar',
    'Santa Marta',
    'Barranquilla',
    'Bogotá',
    'Medellín',
    'Cali'
  ];
  String? valueChoose = 'Empleado';
  String? valueChooseCiudades = 'Valledupar';

  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(48),
                      ),
                      width: 100,
                      height: 100,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
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
                  controller: controlnombres,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Nombre completo de usuario o compañía',
                      icon: const Icon(Icons.message),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlnombres.clear();
                        },
                      )
                      //probar suffix
                      ),
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
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controltelefono,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Teléfono',
                      icon: const Icon(Icons.lock),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controltelefono.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: DropdownButton(
                  value: valueChooseCiudades,
                  onChanged: (String? value) {
                    setState(() {
                      valueChooseCiudades = value;
                    });
                  },
                  items: listCiudades
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 15, 50, 20),
                child: MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    if (controlcontrasena.text.isNotEmpty &&
                        controlnombres.text.isNotEmpty &&
                        controlapellidos.text.isNotEmpty &&
                        controltelefono.text.isNotEmpty &&
                        controlcorreoelectronico.text.isNotEmpty) {
                      controlf
                          .registrarEmail(controlcorreoelectronico.text,
                              controlcontrasena.text, valueChoose.toString())
                          .then((value) {
                        if (controlf.emailf != 'Sin registro') {
                          registrarUserProfile(controlf.uid);
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
                          limpiar();
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'El usuario ya está registrado con este correo'),
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
                                      'El usuario ya está registrado con este correo'),
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

  limpiar() {
    controlcorreoelectronico.clear();
    controlcontrasena.clear();
    controlapellidos.clear();
    controlnombres.clear();
    controltelefono.clear();
  }

  registrarUserProfile(String uid) async {
    await firebase.collection('Usuarios').doc(uid).set({
      "foto": '',
      "nombres": controlnombres.text,
      "tipousuario": valueChoose,
      "correo": controlcorreoelectronico.text,
      "contraseña": controlcontrasena.text,
      "telefono": controltelefono.text,
      "ciudad": valueChooseCiudades,
      "cv": '',
      "userid": uid
    });
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
