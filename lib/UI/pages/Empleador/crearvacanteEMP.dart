import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../../../domain/controller/controladorAuth.dart';
import '../../../domain/models/vacante.dart';
import '../login.dart';

class AdicionarVacantes extends StatefulWidget {
  final TextEditingController correo;
  const AdicionarVacantes(this.correo, {Key? key}) : super(key: key);

  @override
  State<AdicionarVacantes> createState() => _AdicionarVacantesState();
}

class _AdicionarVacantesState extends State<AdicionarVacantes> {
  List<String> list = [
    'Valledupar',
    'Barranquilla ',
    'Santa Marta ',
    'Cartagena',
    'Bogota '
  ];
  String? valueChoose = 'Valledupar';

  List<String> listEstado = [
    'Activa',
    'Inactiva',
  ];
  String? valueChooseEstado = 'Activa';

  TextEditingController controlidvacante = TextEditingController();
  //TextEditingController controlfechacreacion = TextEditingController();
  TextEditingController controlCargo = TextEditingController();
  TextEditingController controlSalario = TextEditingController();
  TextEditingController controldescripcion = TextEditingController();
  TextEditingController controlrequisitos = TextEditingController();
  TextEditingController controlempresa = TextEditingController();

  final firebase = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Controllerauthf controlf = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('NUEVA VACANTE'),
          automaticallyImplyLeading: false,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
            onPressed: () {
              if (controlidvacante.text.isNotEmpty &&
                  controlempresa.text.isNotEmpty &&
                  controlCargo.text.isNotEmpty &&
                  controldescripcion.text.isNotEmpty &&
                  controlrequisitos.text.isNotEmpty &&
                  controlSalario.text.isNotEmpty) {
                crearvacantes();
                limpiar();
              } else {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: const Text('Campos vacíos'),
                          content: const Text('Complete los campos vacíos'),
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
            }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextFormField(
                      /////AQUI
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: controlidvacante,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(7),
                            child: Icon(Icons.close),
                          ),
                          onTap: () {
                            controlidvacante.clear();
                          },
                        ),
                        labelText: 'ID Vacante',
                      ),
                      onChanged: (value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextFormField(
                      /////AQUI
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: controlempresa,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.business,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(7),
                            child: Icon(Icons.close),
                          ),
                          onTap: () {
                            controlempresa.clear();
                          },
                        ),
                        labelText: 'Empresa',
                      ),
                      onChanged: (value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextFormField(
                      /////AQUI
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: controlCargo,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.assignment_ind,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(7),
                            child: Icon(Icons.close),
                          ),
                          onTap: () {
                            controlCargo.clear();
                          },
                        ),
                        labelText: 'Cargo',
                      ),
                      onChanged: (value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextFormField(
                      maxLines: 3,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: controldescripcion,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.description,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(7),
                            child: Icon(Icons.close),
                          ),
                          onTap: () {
                            controldescripcion.clear();
                          },
                        ),
                        labelText: 'Descripción',
                      ),
                      onChanged: (value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextFormField(
                      maxLines: 3,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: controlrequisitos,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.content_paste,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(7),
                            child: Icon(Icons.close),
                          ),
                          onTap: () {
                            controlrequisitos.clear();
                          },
                        ),
                        labelText: 'Requisitos',
                      ),
                      onChanged: (value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: controlSalario,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(7),
                            child: Icon(Icons.close),
                          ),
                          onTap: () {
                            controlSalario.clear();
                          },
                        ),
                        labelText: 'Salario',
                      ),
                      onChanged: (value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20.0),
                  isExpanded: true,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  value: valueChoose,
                  icon: const Icon(Icons.location_city),
                  underline: Container(
                    height: 4,
                    width: 30,
                  ),
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
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20.0),
                  isExpanded: true,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  value: valueChooseEstado,
                  icon: const Icon(Icons.check),
                  underline: Container(
                    height: 4,
                    width: 30,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      valueChooseEstado = value;
                    });
                  },
                  items:
                      listEstado.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                ),
              ),
              /*
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    if (controlidvacante.text.isNotEmpty &&
                        controlempresa.text.isNotEmpty &&
                        controlCargo.text.isNotEmpty &&
                        controldescripcion.text.isNotEmpty &&
                        controlrequisitos.text.isNotEmpty &&
                        controlSalario.text.isNotEmpty) {
                      //var nombre = getName();
                      //print(nombre);

                      crearvacantes();
                      limpiar();
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
                    'Crear Vacante',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),*/
            ],
          ),
        ));
  }

  limpiar() {
    controlidvacante.clear();
    //controlfechacreacion.clear();
    controlCargo.clear();
    controldescripcion.clear();
    controlrequisitos.clear();
    controlSalario.clear();
    controlempresa.clear();
  }

  crearvacantes() async {
    final DateTime now = DateTime.now();
    final DateFormat formato = DateFormat('dd/MM/yyyy');
    final String fecha = formato.format(now);
    //print(formatted);
    try {
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Vacantes')
          .doc(controlidvacante.text)
          .set({
        "iduser": controlf.uid,
        "idvacante": controlidvacante.text,
        "fecha": fecha,
        "empresa": controlempresa.text,
        "cargo": controlCargo.text,
        "descripcion": controldescripcion.text,
        "requisitos": controlrequisitos.text,
        "salario": controlSalario.text,
        "ciudad": valueChoose,
        "estado": valueChooseEstado,
      });
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Nueva Vacante'),
                content: const Text('Se ha creado correctamente.'),
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
    } catch (e) {
      if (kDebugMode) {
        print('Error...' + e.toString());
      }
    }
  }
}
