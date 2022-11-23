// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
  TextEditingController controlusuario = TextEditingController();
  TextEditingController controlcontrasena = TextEditingController();
  TextEditingController controltipousuario = TextEditingController();
  TextEditingController controlcorreoelectronico = TextEditingController();

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
                  controller: controlusuario,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Usuario',
                      icon: const Icon(Icons.person),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlusuario.clear();
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
                padding: const EdgeInsets.all(40.0),
                child: MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    if (controlusuario.text.isNotEmpty &&
                        controlcontrasena.text.isNotEmpty &&
                        controlcorreoelectronico.text.isNotEmpty) {
                      // Agregar a la lista los valores de cada texto

                      listaUsuarios.add(Usuario(
                          tipo_usuario: valueChoose,
                          usuario: controlusuario.text,
                          contrasena: controlcontrasena.text,
                          correo_electronico: controlcorreoelectronico.text));

                      // dialogo
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Nuevo Usuario'),
                                content:
                                    const Text('Se ha guardado correctamente.'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const Login()),
                                        );
                                        setState(() {});
                                        //Navigator.pop(context);
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
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Registre los campos'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Ok',
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              ));
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
}
