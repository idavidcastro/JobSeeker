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
                  return Column(children: [
                    const Padding(padding: EdgeInsets.all(20.0)),
                    const Text('ID VACANTE ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text(
                      widget.idvacante,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    const Text('EMPRESA ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.empresa,
                        style: const TextStyle(fontSize: 18.0)),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    const Text(' CARGO ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.cargo, style: const TextStyle(fontSize: 18.0)),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    const Text('SALARIO ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.salario,
                        style: const TextStyle(fontSize: 18.0)),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    const Text('CIUDAD ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.ciudad, style: TextStyle(fontSize: 18.0)),
                    const Padding(padding: EdgeInsets.all(25.0)),
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
                    )
                  ]);
                })
            : const Icon(Icons.abc),
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
      String userid) {
    // ignore: prefer_const_constructors
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return MaterialButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
            child: const Text('Postularse',
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 50.0,
          color: Colors.black,
          onPressed: () {
            crearPostulacion(foto, nombres, tipousuario, correo, contrasena,
                telefono, ciudad, cv, userid);
          });
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
      String userid) async {
    try {
      //crear postulacion para empleado
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Postulaciones')
          .doc()
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
        "estado": widget.estado,
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
          .doc()
          .set({
        "foto": foto,
        "nombres": nombres,
        "tipousuario": tipousuario,
        "correo": correo,
        "contraseña": contrasena,
        "telefono": telefono,
        "ciudad": ciudad,
        "cv": cv,
        "userid": userid
      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
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
