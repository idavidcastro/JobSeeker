import 'package:flutter/material.dart';
import '../UI/pages/Empleado/busqueda.dart';
import '../UI/pages/Empleado/config.dart';
import '../UI/pages/Empleado/vacantes.dart';

class Routes extends StatelessWidget {
  final TextEditingController correo;
  final int index;
  const Routes(this.correo, {Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      PageBusqueda(correo),
      Bienvenida(correo),
      PageConfig(correo)
    ];
    return myList[index];
  }
}
