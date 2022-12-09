import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/controller/controladorAuth.dart';

class EditarConfig extends StatefulWidget {
  const EditarConfig({Key? key}) : super(key: key);

  @override
  State<EditarConfig> createState() => _EditarConfigState();
}

class _EditarConfigState extends State<EditarConfig> {
  List<String> listCiudades = [
    'Valledupar',
    'Santa Marta',
    'Barranquilla',
    'Bogotá',
    'Medellín',
    'Cali'
  ];

  String? valueChooseCiudades = 'Valledupar';
  ImagePicker picker = ImagePicker();

  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcontrasena = TextEditingController();
  TextEditingController controltipousuario = TextEditingController();
  TextEditingController controlcorreoelectronico = TextEditingController();

  Controllerauthf controlf = Get.find();
  final firebase = FirebaseFirestore.instance;
  final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;

  var _image;

  _camGaleria(bool op) async {
    XFile? image;
    image = op
        ? await picker.pickImage(source: ImageSource.camera, imageQuality: 50)
        : await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('EDITAR INFORMACIÓN'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.check),
          onPressed: () {
            actualizarPerfil();
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Actualización'),
                      content: const Text('Se ha actualizado el perfil'),
                      actions: <Widget>[
                        MaterialButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        _opcioncamara(context);
                      },
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.black,
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        controller: controlnombres,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          suffix: GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(Icons.close),
                            ),
                            onTap: () {
                              controlnombres.clear();
                            },
                          ),
                          labelText: 'Nombre completo de usuario o compañía',
                        ),
                        onChanged: (value) {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        controller: controlcorreoelectronico,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          suffix: GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(Icons.close),
                            ),
                            onTap: () {
                              controlcorreoelectronico.clear();
                            },
                          ),
                          labelText: 'Correo electronico',
                        ),
                        onChanged: (value) {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        controller: controltelefono,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          suffix: GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(Icons.close),
                            ),
                            onTap: () {
                              controltelefono.clear();
                            },
                          ),
                          labelText: 'Teléfono',
                        ),
                        onChanged: (value) {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      value: valueChooseCiudades,
                      onChanged: (String? value) {
                        setState(() {
                          valueChooseCiudades = value;
                        });
                      },
                      items: listCiudades
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Icon(
                      Icons.document_scanner,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Imagen de Galeria'),
                    onTap: () {
                      _camGaleria(false);
                      Get.back();
                      // Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Capturar Imagen'),
                  onTap: () {
                    _camGaleria(true);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  actualizarPerfil() async {
    print(_image);
    var url = '';
    if (_image != null) {
      url = await cargarfoto(_image, controlf.uid);
    }

    try {
      //crear postulacion para empleado
      await firebase.collection('Usuarios').doc(controlf.uid).update({
        "foto": url,
        "nombres": controlnombres.text,
        "correo": controlcorreoelectronico.text,
        "telefono": controltelefono.text,
        "ciudad": valueChooseCiudades,
        "cv": ''
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error...' + e.toString());
      }
    }
  }

  limpiar() {
    controlcorreoelectronico.clear();
    controlcontrasena.clear();
    controlapellidos.clear();
    controlnombres.clear();
    controltelefono.clear();
  }

  registrarUserProfile(String uid) async {
    print(_image);
    var url = '';
    if (_image != null) {
      url = await cargarfoto(_image, uid);
    }

    try {
      await firebase.collection('Usuarios').doc(uid).set({
        "foto": url,
        "nombres": controlnombres.text,
        "tipousuario": '',
        "correo": controlcorreoelectronico.text,
        "contraseña": controlcontrasena.text,
        "telefono": controltelefono.text,
        "ciudad": valueChooseCiudades,
        "cv": '',
        "userid": uid
      });
    } catch (e) {
      print('Error...' + e.toString());
    }
  }

  static Future<dynamic> cargarfoto(var foto, var idUser) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Usuarios");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idUser).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
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
