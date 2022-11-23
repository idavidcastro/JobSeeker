import 'package:flutter/material.dart';

class BottomNavigationEMP extends StatefulWidget {
  final Function currentIndex;
  const BottomNavigationEMP({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<BottomNavigationEMP> createState() => _BottomNavigationEMPState();
}

class _BottomNavigationEMPState extends State<BottomNavigationEMP> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
            widget.currentIndex(i);
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 25.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Nueva'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu), label: 'Configuración'),
        ]);
  }
}
