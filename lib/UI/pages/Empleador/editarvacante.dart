import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/domain/controller/controladorAuth.dart';

class EditarVacante extends StatefulWidget {
  String iduser;
  String idvacante;
  String fechacreacion;
  String empresa;
  String cargo;
  String descripcion;
  String requisitos;
  String salario;
  String ciudad;
  String estado;
  EditarVacante(
      this.iduser,
      this.idvacante,
      this.fechacreacion,
      this.empresa,
      this.cargo,
      this.descripcion,
      this.requisitos,
      this.salario,
      this.ciudad,
      this.estado,
      {Key? key})
      : super(key: key);
  @override
  State<EditarVacante> createState() => _EditarVacanteState();
}

class _EditarVacanteState extends State<EditarVacante> {
  final firebase = FirebaseFirestore.instance;
  Controllerauthf controlf = Get.find();

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

  //TextEditingController controlleridvacante = TextEditingController();
  TextEditingController controllerempresa = TextEditingController();
  TextEditingController controllercargo = TextEditingController();
  TextEditingController controllerdescripcion = TextEditingController();
  TextEditingController controllerrequisitos = TextEditingController();
  TextEditingController controllersalario = TextEditingController();
  //TextEditingController controllerciudad = TextEditingController();
  @override
  void initState() {
    setState(() {
      controllerempresa.text = widget.empresa;
      controllercargo.text = widget.cargo;
      controllerdescripcion.text = widget.descripcion;
      controllerrequisitos.text = widget.requisitos;
      controllersalario.text = widget.salario;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('EDITAR VACANTE'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: TextFormField(
                      /////AQUI
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: controllerempresa,
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
                            controllerempresa.clear();
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
                      controller: controllercargo,
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
                            controllercargo.clear();
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
                      controller: controllerdescripcion,
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
                            controllerdescripcion.clear();
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
                      controller: controllerrequisitos,
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
                            controllerrequisitos.clear();
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
                      controller: controllersalario,
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
                            controllersalario.clear();
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
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 50.0,
                    color: Colors.black,
                    onPressed: () {
                      actualizarVacante(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 8.0),
                      child: const Text('Actualizar',
                          style: TextStyle(color: Colors.white, fontSize: 17)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  actualizarVacante(BuildContext context) async {
    try {
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Vacantes')
          .doc(widget.idvacante)
          .update({
        "empresa": controllerempresa.text,
        "cargo": controllercargo.text,
        "descripcion": controllerdescripcion.text,
        "requisitos": controllerrequisitos.text,
        "salario": controllersalario.text,
        "ciudad": valueChoose,
        "estado": valueChooseEstado,
      });
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Actualización'),
                content:
                    Text('Se ha actualizado la vacante ${widget.idvacante}.'),
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
