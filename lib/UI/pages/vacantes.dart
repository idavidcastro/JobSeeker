import 'package:flutter/material.dart';

import '../../domain/models/vacante.dart';

class Bienvenida extends StatefulWidget {
  late final Function currentIndex;
  static String id = 'Bienvenida';

  @override
  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  //final List _vacantes = listaVacantes;
  int _currentTabIndex = 0;
  late bool _value = false;
  late bool _value2 = false;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('INICIO'),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Eliminar'),
                        content:
                            const Text('Desea eliminar esta postulación?.'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Sí',
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ));
              _value = false;
              _value2 = false;
            }),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                      )
                    ],
                    //border: Border.all(color: Colors.black, width: 6.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text('Apple'),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text('Diseñador Gráfico',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text('3.000.000'),
                              ),
                              // ignore: unnecessary_const
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  children: const <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 15.0,
                                    ),
                                    Text('Los Angeles, CA'),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Checkbox(
                                activeColor: Colors.black,
                                value: _value,
                                onChanged: (val) {
                                  setState(() {
                                    _value = val!;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                      )
                    ],
                    //border: Border.all(color: Colors.black, width: 6.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text('Grupo Aval'),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text('Economista',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text('2.000.000'),
                              ),
                              // ignore: unnecessary_const
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  children: const <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 15.0,
                                    ),
                                    Text('Bogotá, CO'),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Checkbox(
                                activeColor: Colors.black,
                                value: _value2,
                                onChanged: (val) {
                                  setState(() {
                                    _value2 = val!;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _vacante1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Apple'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Diseñador Gráfico',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('3.000.000'),
              ),
              // ignore: unnecessary_const
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 15.0,
                    ),
                    Text('Los Angeles, CA'),
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.indeterminate_check_box),
          )
        ],
      ),
    ],
  );
}

Widget _vacante2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Grupo Aval'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Economista',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('2.000.000'),
              ),
              // ignore: unnecessary_const
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 15.0,
                    ),
                    Text('Bogotá, CO'),
                  ],
                ),
              )
            ],
          ),
          const Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(Icons.indeterminate_check_box))
        ],
      ),
    ],
  );
}
