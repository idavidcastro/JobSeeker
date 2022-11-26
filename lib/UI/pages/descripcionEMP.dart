import 'dart:html';

import 'package:flutter/material.dart';
import 'package:jobseeker/UI/pages/postuladosEMP.dart';

class DescripcionEMP extends StatefulWidget {
  String idVacante;
  String empresa;
  String cargo;
  String salario;
  String ciudad;
  DescripcionEMP(
      this.idVacante, this.empresa, this.cargo, this.salario, this.ciudad,
      {Key? key})
      : super(key: key);

  @override
  State<DescripcionEMP> createState() => _DescripcionEMPState();
}

class _DescripcionEMPState extends State<DescripcionEMP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DESCRIPCIÓN DE VACANTE'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [ 
            Text(widget.idVacante),
             Text(widget.empresa),
            Text(widget.cargo),
            Text(widget.salario),
            Text(widget.ciudad),
            _bottonPostulados()
          ]
          
        )
        
        
        );
  }
  
  

  Widget _bottonPostulados() {
  // ignore: prefer_const_constructors
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return MaterialButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
          child: const Text('Ver Postulados',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 50.0,
        color: Colors.black,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const postuladosemp()));
        });
  });
}
}
