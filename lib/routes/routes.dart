import 'package:flutter/material.dart';
import '../UI/pages/busqueda.dart';
import '../UI/pages/config.dart';
import '../UI/pages/vacantes.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const PageBusqueda(),
      Bienvenida(),
      const PageConfig()
    ];
    return myList[index];
  }
}
