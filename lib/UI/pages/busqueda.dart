import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/controller/controllerfirebase.dart';
import '../../domain/models/vacante.dart';
import 'app.dart';
import 'descripcionEMP.dart';

class PageBusqueda extends StatefulWidget {
  const PageBusqueda({Key? key}) : super(key: key);

  @override
  State<PageBusqueda> createState() => _PageBusquedaState();
}

class _PageBusquedaState extends State<PageBusqueda> {
  //final List _vacantes = listaVacantes;
  List searchResult = [];
  late bool _value = false;
  late bool _value2 = false;
  late bool _value3 = false;

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Vacantes')
        .where('cargo', arrayContains: query)
        .get();
    searchResult = result.docs.map((e) => e.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    ConsultasController controladorvacante = Get.find();
    controladorvacante.consultaVacantes().then((value) => null);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "BUSCAR",
            fillColor: Color(Colors.white.blue),
            icon: Icon(Icons.search),
            iconColor: Color(Colors.white.green),
            hintStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onChanged: (query) {
            searchFromFirebase(query);
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.check),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Postulación'),
                      content:
                          const Text('Se han realizado las postulaciones.'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const Home()),
                              );
                              setState(() {});
                              //Navigator.pop(context);
                            },
                            child: const Text(
                              'Ok',
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
          }),

      /*  body: Obx(
        () => controladorvacante.getVacantesGral?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorvacante.getVacantesGral?.isEmpty == true
                    ? 0
                    : controladorvacante.getVacantesGral!.length,
                itemBuilder: (context, posicion) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    child: InkWell(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 12, 15, 0),
                                child: Text(controladorvacante
                                    .getVacantesGral![posicion].empresa),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 2),
                                child: Text(
                                    controladorvacante
                                        .getVacantesGral![posicion].cargo,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 2),
                                child: Text(controladorvacante
                                    .getVacantesGral![posicion].salario),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 12),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 15.0,
                                    ),
                                    Text(controladorvacante
                                        .getVacantesGral![posicion].ciudad),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DescripcionEMP(
                                        controladorvacante
                                            .getVacantesGral![posicion]
                                            .idVacante,
                                        controladorvacante
                                            .getVacantesGral![posicion].empresa,
                                        controladorvacante
                                            .getVacantesGral![posicion].cargo,
                                        controladorvacante
                                            .getVacantesGral![posicion].salario,
                                        controladorvacante
                                            .getVacantesGral![posicion].ciudad,
                                      )));
                        }),
                  );
                })
            : const Icon(Icons.abc),
      ),*/
    );
  }
}

Widget _barraDeOpciones() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 25.0,
            icon: const Icon(Icons.settings_input_composite_sharp),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 25.0,
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ]),
  );
}
