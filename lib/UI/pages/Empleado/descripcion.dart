import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DESCRIPCIÓN DE VACANTE'),
        backgroundColor: Colors.black,
      ),
      body: new Center(
        child: new Column(children: [
          Padding(padding: new EdgeInsets.all(20.0)),
          Text('ID VACANTE ',
              style: new TextStyle(fontWeight: FontWeight.bold)),
          Padding(padding: new EdgeInsets.all(5.0)),
          Text(
            widget.idvacante,
            style: new TextStyle(fontSize: 18.0),
          ),
          Padding(padding: new EdgeInsets.all(10.0)),
          Text('EMPRESA ', style: new TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.empresa, style: new TextStyle(fontSize: 18.0)),
          Padding(padding: new EdgeInsets.all(10.0)),
          Text(' CARGO ', style: new TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.cargo, style: new TextStyle(fontSize: 18.0)),
          Padding(padding: new EdgeInsets.all(10.0)),
          Text('SALARIO ', style: new TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.salario, style: new TextStyle(fontSize: 18.0)),
          Padding(padding: new EdgeInsets.all(10.0)),
          Text('CIUDAD ', style: new TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.ciudad, style: new TextStyle(fontSize: 18.0)),
          Padding(padding: new EdgeInsets.all(25.0)),
          _bottonPostularse()
        ]),
      ),
    );
  }

  Widget _bottonPostularse() {
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
            crearPostulacion();
          });
    });
  }

  crearPostulacion() async {
    try {
      //crear postulacion para empleado
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Postulaciones')
          .doc()
          .set({
        "idPostulación": controlf.uid,
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
      //crear postuladPo en user creador (EMLEADOR)
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
        "idPostulado": controlf.uid,
        "idusercreador": widget.iduser,
        "correo": controlf.emailf
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
