import 'package:flutter/foundation.dart';
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
  List<Vacante> _vacanteAdd = [];
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
  TextEditingController controlfechacreacion = TextEditingController();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controlidvacante,
                  decoration: InputDecoration(
                      filled: true,
                      //hintText: 'Tipo Usuario',
                      labelText: 'Id Vacante',
                      icon: const Icon(Icons.date_range),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlidvacante.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controlfechacreacion,
                  decoration: InputDecoration(
                      filled: true,
                      //hintText: 'Tipo Usuario',
                      labelText: 'Fecha de creación',
                      icon: const Icon(Icons.date_range),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlfechacreacion.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controlempresa,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Empresa',
                      icon: const Icon(Icons.description),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlempresa.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controlCargo,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Cargo',
                      icon: const Icon(Icons.business_center),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlCargo.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controldescripcion,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Descripción',
                      icon: const Icon(Icons.description),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controldescripcion.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextFormField(
                  controller: controlrequisitos,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(35)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(35)),
                      prefixIcon: const Icon(
                        Icons.content_paste,
                        color: Colors.black,
                      ),
                      filled: true,
                      labelText: 'Requisitos',
                      labelStyle: TextStyle(color: Colors.black),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlrequisitos.clear();
                        },
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controlSalario,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Salario mensual',
                      icon: const Icon(Icons.attach_money),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlSalario.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20.0),
                  isExpanded: true,
                  style: TextStyle(
                    fontSize: 15,
                  ),
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
                  style: TextStyle(
                    fontSize: 15,
                  ),
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
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    if (controlidvacante.text.isNotEmpty &&
                        controlempresa.text.isNotEmpty &&
                        controlfechacreacion.text.isNotEmpty &&
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
              ),
            ],
          ),
        ));
  }

  limpiar() {
    controlidvacante.clear();
    controlfechacreacion.clear();
    controlCargo.clear();
    controldescripcion.clear();
    controlrequisitos.clear();
    controlSalario.clear();
    controlempresa.clear();
  }

  crearvacantes() async {
    try {
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Vacantes')
          .doc(controlidvacante.text)
          .set({
        "iduser": controlf.uid,
        "idvacante": controlidvacante.text,
        "fechacreacion": controlfechacreacion.text,
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
