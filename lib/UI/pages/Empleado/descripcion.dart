import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/domain/controller/controllerfirebaseUsuario.dart';

import '../../../domain/controller/controladorAuth.dart';

class Descripcion extends StatefulWidget {
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
  Descripcion(
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
  State<Descripcion> createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _bottonPostularse(
                            controladorusuario.getUsuarios![posicion].foto,
                            controladorusuario.getUsuarios![posicion].nombres,
                            controladorusuario
                                .getUsuarios![posicion].tipousuario,
                            controladorusuario.getUsuarios![posicion].correo,
                            controladorusuario
                                .getUsuarios![posicion].contrasena,
                            controladorusuario.getUsuarios![posicion].telefono,
                            controladorusuario.getUsuarios![posicion].ciudad,
                            controladorusuario.getUsuarios![posicion].cv,
                            controladorusuario.getUsuarios![posicion].userid,
                            widget.idvacante),
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
            crearPostulacion(foto, nombres, tipousuario, correo, contrasena,
                telefono, ciudad, cv, userid, idvacante);
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: const Text('Postularse',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ));
    });
  }

  crearPostulacion(
      String foto,
      String nombres,
      String tipousuario,
      String correo,
      String contrasena,
      String telefono,
      String ciudad,
      String cv,
      String userid,
      String idvacante) async {
    bool encontro = false;
    CollectionReference ref = FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(controlf.uid)
        .collection('Postulaciones');
    QuerySnapshot usuario = await ref.get();
    if (usuario.docs.length != 0) {
      for (var cursor in usuario.docs) {
        if (cursor.get('idvacante') == idvacante) {
          encontro = true;
          print('si lo encontro xd xd');
        }
      }
    }

    if (encontro == true) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content:
                    const Text('El usuario ya está postulado en esta vacante'),
                actions: <Widget>[
                  MaterialButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    } else {
      try {
        //crear postulacion para empleado
        await firebase
            .collection('Usuarios')
            .doc(controlf.uid)
            .collection('Postulaciones')
            .doc(widget.idvacante)
            .set({
          "idPostulado": controlf.uid,
          "idusercreador": widget.iduser,
          "idvacante": widget.idvacante,
          "fechacreacion": widget.fechacreacion,
          "empresa": widget.empresa,
          "cargo": widget.cargo,
          "descripcion": widget.descripcion,
          "requisitos": widget.requisitos,
          "salario": widget.salario,
          "ciudad": widget.ciudad,
          "estado": 'Aplicado',
        });
        //crear postulado en user creador (EMLEADOR)
        //necesito consultar el usuario para pasarlo, el id del usuario esta en controlf.uid,
        // es decir el usuario que esta actualmente en login

        await firebase
            .collection('Usuarios')
            .doc(widget.iduser)
            .collection('Vacantes')
            .doc(widget.idvacante)
            .collection('Postulados')
            .doc(controlf.uid)
            .set({
          "foto": foto,
          "nombres": nombres,
          "tipousuario": tipousuario,
          "correo": correo,
          "contraseña": contrasena,
          "telefono": telefono,
          "ciudad": ciudad,
          "cv": cv,
          "userid": userid,
          "estado": 'Aplicado'
        });

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Nueva postulación'),
                  content: const Text('Se ha postulado a la vacante'),
                  actions: <Widget>[
                    MaterialButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
      } catch (e) {
        if (kDebugMode) {
          print('Error...' + e.toString());
        }
      }
    }
  }
}
