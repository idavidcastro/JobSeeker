import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/controller/controladorAuth.dart';
import '../../../domain/controller/controllerfirebase.dart';
import '../../../domain/models/vacante.dart';
import '../app.dart';
import 'descripcion.dart';
import '../Empleador/descripcionEMP.dart';

class PageBusqueda extends StatefulWidget {
  final TextEditingController correo;
  const PageBusqueda(this.correo, {Key? key}) : super(key: key);

  @override
  State<PageBusqueda> createState() => _PageBusquedaState();
}

class _PageBusquedaState extends State<PageBusqueda> {
  //final List _vacantes = listaVacantes;
  int _currentTabIndex = 0;
  late bool _value = false;
  late bool _value2 = false;

  int index = 0;

  String cargo = "";

  @override
  Widget build(BuildContext context) {
    //TextEditingController cargo = TextEditingController();
    Controllerauthf controlf = Get.find();
    print("El id nueeuueue");
    print(controlf.uid);
    ConsultasController controladorvacante = Get.find();
    controladorvacante.consultaVacantes().then((value) => null);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Card(
            child: TextField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search...'),
              onChanged: (val) {
                setState(() {
                  cargo = val;
                });
              },
            ),
          ),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.delete),
            onPressed: () {}),
        body:
            /*
          StreamBuilder<QuerySnapshot>(
            stream: (cargo != "" && cargo != null)
                ? FirebaseFirestore.instance
                    .collection('Vacantes')
                    .where("searchKeywords", arrayContains: cargo)
                    .snapshots()
                : FirebaseFirestore.instance.collection('Vacantes').snapshots(),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.waiting)
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data!.docs[index];
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 12, 15, 0),
                                      child: Text(data['empresa']),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 2),
                                      child: Text(data['cargo'],
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 2),
                                      child: Text(data['salario']),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 12),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 15.0,
                                          ),
                                          Text(data['ciudad']),
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
                                        builder: (_) => Descripcion(
                                              widget.correo,
                                              data['idvacante'],
                                              data['empresa'],
                                              data['cargo'],
                                              data['salario'],
                                              data['ciudad'],
                                            )));
                              }),
                        );
                      });
            },
          )*/

            Obx(
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
                                    builder: (_) => Descripcion(
                                        controladorvacante
                                            .getVacantesGral![posicion].iduser,
                                        controladorvacante
                                            .getVacantesGral![posicion]
                                            .idvacante,
                                        controladorvacante
                                            .getVacantesGral![posicion]
                                            .fechacreacion,
                                        controladorvacante
                                            .getVacantesGral![posicion].empresa,
                                        controladorvacante
                                            .getVacantesGral![posicion].cargo,
                                        controladorvacante
                                            .getVacantesGral![posicion]
                                            .descripcion,
                                        controladorvacante
                                            .getVacantesGral![posicion]
                                            .requisitos,
                                        controladorvacante
                                            .getVacantesGral![posicion].salario,
                                        controladorvacante
                                            .getVacantesGral![posicion].ciudad,
                                        controladorvacante
                                            .getVacantesGral![posicion]
                                            .estado)));
                          }),
                    );
                  })
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.error,
                        size: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No se encontraron registros'),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}



/*
class _PageBusquedaState extends State<PageBusqueda> {
  late Map<String, dynamic> vacantesMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  late final String cargo;
  late final String empresa;
  late final String salario;

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = false;
    });
    await _firestore
        .collection('Vacantes')
        .where("cargo", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        vacantesMap = value.docs[0].data();
        isLoading = true;
      });

      print(vacantesMap['cargo']);
      print(vacantesMap['empresa']);
      print(vacantesMap['salario']);

      cargo = vacantesMap['cargo'];
      empresa = vacantesMap['empresa'];
      salario = vacantesMap['salario'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BUSQUEDA'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          _imprimirlista(),
          _botonbusqueda(),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _search,
                onEditingComplete: () {
                  _search;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "BUSCAR",
                ),
              )),
        ],
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
                              /*
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const Home()),
                              );*/
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

  Widget _botonbusqueda() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return MaterialButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
          child: const Text('Buscar',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 50.0,
        color: Colors.black,
        onPressed: onSearch,
      );
    });
    leading:
    Icon(Icons.account_box, color: Colors.black);
    title:
    Text(
      vacantesMap!['cargo'],
      style: TextStyle(color: Colors.black, fontSize: 17),
    );
    subtitle:
    Text(vacantesMap!['empresa']);
    Column();
  }

  Widget _imprimirlista() {
    return Column(
      children: [
        Text(cargo),
        Text(empresa),
        Text(salario),
      ],
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
*/