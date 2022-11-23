import 'package:flutter/material.dart';

import 'login.dart';

class RecuperarPsswd extends StatefulWidget {
  const RecuperarPsswd({Key? key}) : super(key: key);

  @override
  State<RecuperarPsswd> createState() => _RecuperarPsswdState();
}

class _RecuperarPsswdState extends State<RecuperarPsswd> {
  TextEditingController controllercorreo = TextEditingController();

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
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 50, 20, 0),
              child: TextField(
                //controller: controllercorreo,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                  iconSize: 50,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('Recuperar contraseña'),
                              content: const Text(
                                  'Se envió una nueva contraseña a su correo.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const Login()));
                                    },
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(color: Colors.black),
                                    ))
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
}
