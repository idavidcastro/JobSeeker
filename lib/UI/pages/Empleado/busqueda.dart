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
          title: const Text('BUSQUEDA'),
          backgroundColor: Colors.black,
        ),
        body: Obx(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 12, 15, 0),
                                      child: Text(controladorvacante
                                          .getVacantesGral![posicion].empresa),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 2),
                                      child: Text(
                                          controladorvacante
                                              .getVacantesGral![posicion].cargo,
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 2),
                                      child: Text(controladorvacante
                                          .getVacantesGral![posicion].salario),
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
                                          Text(controladorvacante
                                              .getVacantesGral![posicion]
                                              .ciudad),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 12, 15, 0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          controladorvacante
                                              .getVacantesGral![posicion].fecha,
                                          style: const TextStyle(fontSize: 12)),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 12),
                                        child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            elevation: 50,
                                            color: Colors.black,
                                            onPressed: () {},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 17,
                                                      vertical: 5),
                                              child: const Text('Postularse',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                            )),
                                      )
                                    ],
                                  ),
                                )
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
