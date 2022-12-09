import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class RecuperarPsswd extends StatefulWidget {
  const RecuperarPsswd({Key? key}) : super(key: key);

  @override
  State<RecuperarPsswd> createState() => _RecuperarPsswdState();
}

class _RecuperarPsswdState extends State<RecuperarPsswd> {
  TextEditingController controllercorreo = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  @override
  void dispose() {
    controllercorreo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Recuperar Contraseña'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    controller: controllercorreo,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      labelText: 'Correo electrónico',
                    ),
                    onChanged: (value) {}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                  iconSize: 50,
                  onPressed: () {
                    resetPsswd();

                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Reestablecer contraseña'),
                              content: const Text(
                                  'Se envió un enlace para reestablecer su contraseña'),
                              actions: <Widget>[
                                MaterialButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Login()),
                                    );
                                  },
                                )
                              ],
                            ));
                    // Devuelvo los datos de la lista _usuarioadd
                    /*
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ListarUsuario())); //Llamar la Vista
                        */
                  },
                  icon: const Icon(Icons.email)),
            )
          ],
        ),
      )),
    );
  }

  resetPsswd() async {
    print(controllercorreo.text);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: controllercorreo.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
