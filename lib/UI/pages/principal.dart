import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final Function currentIndex;
  const BottomNavigation({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busqueda'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Mis Postulaciones'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Perfil'),
        ]);
  }
}
