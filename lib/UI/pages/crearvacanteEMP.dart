import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../../domain/controller/controladorAuth.dart';
import '../../domain/models/vacante.dart';
import 'login.dart';

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

  TextEditingController controlid = TextEditingController();
  TextEditingController controlEmpresa = TextEditingController();
  TextEditingController controlCargo = TextEditingController();
  TextEditingController controlSalario = TextEditingController();
  TextEditingController controlCiudad = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Controllerauthf controlf = Get.find();

  @override
  Widget build(BuildContext context) {
    print("ESTEE ES: ");
    print(controlf.tiposuerREAL);
    print(controlf.uid);
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
              _titulo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controlid,
                  decoration: InputDecoration(
                      filled: true,
                      //hintText: 'Tipo Usuario',
                      labelText: 'id',
                      icon: const Icon(Icons.numbers),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlid.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: TextField(
                  controller: controlEmpresa,
                  decoration: InputDecoration(
                      filled: true,
                      //hintText: 'Tipo Usuario',
                      labelText: 'Empresa',
                      icon: const Icon(Icons.business),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          controlEmpresa.clear();
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
                      icon: const Icon(Icons.person),
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
                  controller: controlSalario,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Salario',
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
                padding: const EdgeInsets.all(40.0),
                child: MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    if (controlid.text.isNotEmpty &&
                        controlEmpresa.text.isNotEmpty &&
                        controlCargo.text.isNotEmpty &&
                        controlSalario.text.isNotEmpty) {
                      // Agregar a la lista los valores de cada texto

                      crearvacantes();

                      // dialogo
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Nueva Vacante'),
                                content:
                                    const Text('Se ha creado correctamente.'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        _limpiar();
                                        setState(() {});
                                        Navigator.pop(context);
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
                                        _limpiar();
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

  _limpiar() {
    controlid.text = '';
    controlEmpresa.text = '';
    controlCargo.text = '';
    controlSalario.text = '';
    controlCiudad.text = '';
  }

  Widget _titulo() {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        "Nueva Vacante",
        style: TextStyle(
            color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  crearvacantes() async {
    try {
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Vacantes')
          .doc()
          .set({
        "id": controlid.text,
        "empresa": controlEmpresa.text,
        "cargo": controlCargo.text,
        "salario": controlSalario.text,
        "ciudad": controlCiudad.text,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error...' + e.toString());
      }
    }
  }
}
