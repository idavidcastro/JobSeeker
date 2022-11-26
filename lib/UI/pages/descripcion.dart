import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Descripcion extends StatefulWidget {
  final TextEditingController correo;
  String idVacante;
  String empresa;
  String cargo;
  String salario;
  String ciudad;
  Descripcion(this.correo, this.idVacante, this.empresa, this.cargo,
      this.salario, this.ciudad,
      {Key? key})
      : super(key: key);
  @override
  State<Descripcion> createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
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
            widget.idVacante,
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
            crearPostulado();
          });
    });
  }

  crearPostulado() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get('correo') == widget.correo.text) {
            String ideuser = cursor.get('id');
            try {
              String id =
                  FirebaseFirestore.instance.collection('Users').doc().id;
              print(id);
              await firebase.collection(ideuser).doc(id).set({});
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Nuevo Usuario'),
                        content: const Text('Usuario nuevo registrado'),
                        actions: <Widget>[
                          MaterialButton(
                            child: const Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ));
            } catch (e) {}
          }
        }
      }
    } catch (e) {}
  }
}
