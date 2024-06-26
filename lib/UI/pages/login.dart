// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/UI/pages/registrarUsuario.dart';
import 'package:jobseeker/domain/controller/controllerfirebase.dart';

import '../../domain/controller/controladorAuth.dart';
import '../../domain/models/usuario.dart';
import 'app.dart';
import 'recuperarpasswd.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllercorreo = TextEditingController();
  TextEditingController controllercontrasena = TextEditingController();
  //TextEditingController controllertipouser = TextEditingController();
  Controllerauthf controlf = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/b/vector-graphic-initials-letter-js-logo-design-template-emblem-hexagon-204622912.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: _nombre(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _correoTextField(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _passwordTextField(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                child: _bottonNuevoLogin(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _bottonNuevoRegistrar(),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: _olvido(),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RecuperarPsswd()));
                  },
                  icon: const Icon(Icons.email),
                  iconSize: 40.0,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _correoTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            controller: controllercorreo,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              labelText: 'Correo',
            ),
            onChanged: (value) {}),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
            /////AQUI
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            obscureText: true,
            controller: controllercontrasena,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              labelText: 'Contraseña',
            ),
            onChanged: (value) {}),
      );
    });
  }

  Widget _bottonNuevoLogin() {
    // ignore: prefer_const_constructors
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 50.0,
          color: Colors.black,
          onPressed: () {
            if (controllercorreo.text.isNotEmpty &&
                controllercontrasena.text.isNotEmpty) {
              controlf
                  .ingresarEmail(
                      controllercorreo.text, controllercontrasena.text)
                  .then((value) {
                if (controlf.emailf != 'Sin registro' &&
                    controlf.tiposuerREAL == 'Empleado') {
                  print(controlf.uid);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Home(controllercorreo)));
                } else if (controlf.emailf != 'Sin registro' &&
                    controlf.tiposuerREAL == 'Empleador') {
                  print(controlf.uid);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Home2(controllercorreo)));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('ERROR'),
                            content: const Text('El usuario no existe'),
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
                          title: const Text('ERROR'),
                          content: const Text('El usuario no existe'),
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
            } else {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Campos vacios'),
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
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: const Text('Iniciar Sesión',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ));
    });
  }

  validarDatos() async {
    bool validacion = false;
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get('correo') == controllercorreo.text.trim() &&
              cursor.get('contraseña') == controllercontrasena.text.trim()) {
            validacion = true;
            if (cursor.get('tipousuario') == 'Empleado') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => Home(controllercorreo)));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => Home2(controllercorreo)));
              print(controllercorreo.text);
            }
          }
        }
        if (validacion == false) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('El usuario no está registrado'),
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
      }
    } catch (e) {}
  }
}

Widget _bottonNuevoRegistrar() {
  // ignore: prefer_const_constructors
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 50.0,
        color: Colors.black,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AdicionarUsuario()));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: const Text('Registrar',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ));
  });
}

Widget _nombre() {
  return const Text(
    "JOB-SEEKER",
    style: const TextStyle(
        color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}

Widget _olvido() {
  return const Text(
    "¿Olvidaste tu contraseña? \n¡Click aquí abajo!",
    style: TextStyle(
        color: Colors.grey,
        fontSize: 17.0,
        decoration: TextDecoration.underline),
    textAlign: TextAlign.center,
  );
}
