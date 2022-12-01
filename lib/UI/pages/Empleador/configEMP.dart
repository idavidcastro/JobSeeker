import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobseeker/UI/pages/Empleador/editarconfigEMP.dart';
import '../login.dart';

class PageConfig2 extends StatefulWidget {
  const PageConfig2({Key? key}) : super(key: key);

  @override
  State<PageConfig2> createState() => _PageConfig2State();
}

class _PageConfig2State extends State<PageConfig2> {
  var _image;
  ImagePicker picker = ImagePicker();

  _camGaleria(bool op) async {
    XFile? image;
    image = op
        ? await picker.pickImage(source: ImageSource.camera, imageQuality: 50)
        : await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('PERFIL'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  _opcioncamara(context);
                },
                child: CircleAvatar(
                  radius: 70,
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
            const Divider(),
            Column(
              children: const [
                Text(
                  'Información Personal',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Rol: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Empleador'),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: const [
                      Text('Nombres: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Andrés Felipe'),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: const [
                      Text('Apellidos: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Calderón Tarifa'),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: const [
                      Text('Ciudad: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Bogotá, CO'),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
            const Divider(),
            //////////
            Column(
              children: const [
                Text(
                  'Información Académica',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Pregrado: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Ingeniero de Sistemas'),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: const [
                      Text('Universidad: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Universidad del Norte'),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Divider()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                                content: const Text('Desea cerrar sesión?'),
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
                                        'Sí',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancelar',
                                        style: TextStyle(color: Colors.red),
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
          ]),
        ),
      ),
    );
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
}
