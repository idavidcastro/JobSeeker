import 'package:flutter/material.dart';

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
          ],
        ));
  }
}
