import 'package:flutter/material.dart';

import '../UI/pages/Empleador/configEMP.dart';
import '../UI/pages/Empleador/crearvacanteEMP.dart';
import '../UI/pages/Empleador/vacantesEMP.dart';

class Routes2 extends StatelessWidget {
  final TextEditingController correo;
  final int index;
  const Routes2(this.correo, {Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      AdicionarVacantes(correo),
      const ListaPrincipalEmpreador(),
      const PageConfig2()
    ];
    return myList[index];
  }
}
