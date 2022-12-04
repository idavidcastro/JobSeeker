import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobseeker/UI/pages/Empleador/editarconfigEMP.dart';
import '../../../domain/controller/controladorAuth.dart';
import '../../../domain/controller/controllerfirebaseUsuario.dart';
import '../login.dart';

class PageConfig2 extends StatefulWidget {
  const PageConfig2({Key? key}) : super(key: key);

  @override
  State<PageConfig2> createState() => _PageConfig2State();
}

class _PageConfig2State extends State<PageConfig2> {
  @override
  Widget build(BuildContext context) {
    Controllerauthf controlf = Get.find();
    ConsultasControllerUsuarios controladorusuarios = Get.find();
    controladorusuarios.consultaPostulados(controlf.uid).then((value) => null);
    var imagen;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('PERFIL'),
      ),
      body: Obx(
        () => controladorusuarios.getUsuarios?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorusuarios.getUsuarios?.isEmpty == true
                    ? 0
                    : controladorusuarios.getUsuarios!.length,
                itemBuilder: (context, posicion) {
                  return Column(
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.black,
                            child: controladorusuarios
                                        .getUsuarios![posicion].foto !=
                                    ''
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.network(
                                      controladorusuarios
                                          .getUsuarios![posicion].foto,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(Icons.person),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(33.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Rol: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      controladorusuarios
                                          .getUsuarios![posicion].tipousuario,
                                      style: const TextStyle(fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Text('Nombres: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      controladorusuarios
                                          .getUsuarios![posicion].nombres,
                                      style: const TextStyle(fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Text('Ciudad: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      controladorusuarios
                                          .getUsuarios![posicion].ciudad,
                                      style: const TextStyle(fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Text('Correo: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      controladorusuarios
                                          .getUsuarios![posicion].correo,
                                      style: const TextStyle(fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Text('Teléfono: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      controladorusuarios
                                          .getUsuarios![posicion].telefono,
                                      style: const TextStyle(fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                            ],
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
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              elevation: 10.0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const EditarConfigEMP()),
                                );
                                setState(() {});
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              highlightElevation: 20.0,
                              color: Colors.black,
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: const Text('Modificar'),
                            ),
                            MaterialButton(
                              elevation: 10.0,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text('Cerrar Sesión'),
                                          content: const Text(
                                              'Desea cerrar sesión?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            const Login()),
                                                  );
                                                  setState(() {});
                                                  //Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Sí',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Cancelar',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ))
                                          ],
                                        ));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              highlightElevation: 20.0,
                              color: Colors.black,
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: const Text('Cerrar Sesión'),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                })
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error,
                      size: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No se encontraron registros'),
                    )
                  ],
                ),
              ),
      ),
    ));
  }
}
