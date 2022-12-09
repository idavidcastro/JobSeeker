import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/UI/pages/Empleado/vacantes.dart';
import 'package:jobseeker/domain/controller/controladorAuth.dart';
import '../../../domain/controller/controllerfirebaseUsuario.dart';

class DescripcionPOST extends StatefulWidget {
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
  DescripcionPOST(
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
  State<DescripcionPOST> createState() => _DescripcionPOSTState();
}

class _DescripcionPOSTState extends State<DescripcionPOST> {
  eliminarPostulacion(String idvacante, String iduser) async {
    try {
      //eliminar en Mis postulaciones
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Postulaciones')
          .doc(idvacante)
          .delete()
          .catchError((e) {});

      //eliminar en postulados

    } catch (e) {}
  }

  eliminarPostulado(String idvacante, String iduser) async {
    try {
      //eliminar en postulados

      await firebase
          .collection('Usuarios')
          .doc(iduser)
          .collection('Vacantes')
          .doc(idvacante)
          .collection('Postulados')
          .doc(controlf.uid)
          .delete()
          .catchError((e) {});
    } catch (e) {}
  }

  Controllerauthf controlf = Get.find();
  final firebase = FirebaseFirestore.instance;

  bool booleanoPostulaciones = false;
  @override
  Widget build(BuildContext context) {
    ConsultasControllerUsuarios controladorusuario = Get.find();
    controladorusuario.consultaPostulados(controlf.uid).then((value) => null);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DESCRIPCIÓN DE VACANTE'),
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => controladorusuario.getUsuarios?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorusuario.getUsuarios?.isEmpty == true
                    ? 0
                    : controladorusuario.getUsuarios!.length,
                itemBuilder: (context, posicion) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                          width: 500,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 8.0,
                              )
                            ],
                            //border: Border.all(color: Colors.black, width: 6.0)
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        const Text('Empresa: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(widget.empresa,
                                              style: const TextStyle(
                                                  fontSize: 16.0)),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Column(
                                      children: [
                                        const Text('Cargo: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(widget.cargo,
                                              style: const TextStyle(
                                                  fontSize: 16.0)),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Column(
                                      children: [
                                        const Text('Descripción: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(widget.descripcion,
                                              style: const TextStyle(
                                                  fontSize: 16.0)),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Column(
                                      children: [
                                        const Text('Requisitos: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(widget.requisitos,
                                              style: const TextStyle(
                                                  fontSize: 16.0)),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Column(
                                      children: [
                                        const Text('Salario: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(widget.salario,
                                              style: const TextStyle(
                                                  fontSize: 16.0)),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Column(
                                      children: [
                                        const Text('Ciudad: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(widget.ciudad,
                                              style: const TextStyle(
                                                  fontSize: 16.0)),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      _bottonPostularse(
                          controladorusuario.getUsuarios![posicion].foto,
                          controladorusuario.getUsuarios![posicion].nombres,
                          controladorusuario.getUsuarios![posicion].tipousuario,
                          controladorusuario.getUsuarios![posicion].correo,
                          controladorusuario.getUsuarios![posicion].contrasena,
                          controladorusuario.getUsuarios![posicion].telefono,
                          controladorusuario.getUsuarios![posicion].ciudad,
                          controladorusuario.getUsuarios![posicion].cv,
                          controladorusuario.getUsuarios![posicion].userid,
                          widget.idvacante)
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
    );
  }

  Widget _bottonPostularse(
      String foto,
      String nombres,
      String tipousuario,
      String correo,
      String contrasena,
      String telefono,
      String ciudad,
      String cv,
      String userid,
      String idvacante) {
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
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Eliminar postulación'),
                      content: const Text(
                          'Desea dejar de postularse a esta vacante?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              eliminarPostulacion(
                                  widget.idvacante, widget.iduser);
                              eliminarPostulado(
                                  widget.idvacante, widget.iduser);

                              setState(() {});
                              Navigator.pop(context);
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
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: const Text('Dejar de postularse',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ));
    });
  }
}
