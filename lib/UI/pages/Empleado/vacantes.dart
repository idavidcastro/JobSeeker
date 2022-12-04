import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jobseeker/domain/controller/peticionfirebasePostulacion.dart';

import '../../../domain/controller/controladorAuth.dart';
import '../../../domain/controller/controllerfirebase.dart';
import '../../../domain/models/vacante.dart';
import 'descripcion.dart';
import '../Empleador/descripcionEMP.dart';

class Bienvenida extends StatefulWidget {
  final TextEditingController correo;
  //final Function currentIndex;
  static String id = 'Bienvenida';

  const Bienvenida(
    this.correo, {
    Key? key,
  }) : super(key: key);

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
    ConsultasControllerPostulacion controladorpostulacion = Get.find();
    controladorpostulacion.consultaDatosPostulacion().then((value) => null);
    final firebase = FirebaseFirestore.instance;
    Controllerauthf controlf = Get.find();

    eliminarPostulacion(String idvacante, String iduser) async {
      try {
        //eliminar en Mis postulaciones
        await firebase
            .collection('Usuarios')
            .doc(controlf.uid)
            .collection('Postulaciones')
            .doc(idvacante)
            .delete()
            .catchError((e) {});

        //eliminar en postulados

      } catch (e) {}
    }

    eliminarPostulado(String idvacante, String iduser) async {
      try {
        //eliminar en postulados

        await firebase
            .collection('Usuarios')
            .doc(iduser)
            .collection('Vacantes')
            .doc(idvacante)
            .collection('Postulados')
            .doc(controlf.uid)
            .delete()
            .catchError((e) {});
      } catch (e) {}
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('MIS POSTULACIONES'),
          backgroundColor: Colors.black,
        ),
        body: Obx(
          () => controladorpostulacion.getPostulacion?.isEmpty == false
              ? ListView.builder(
                  itemCount:
                      controladorpostulacion.getPostulacion?.isEmpty == true
                          ? 0
                          : controladorpostulacion.getPostulacion!.length,
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
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                                title: const Text('Eliminar'),
                                                content: const Text(
                                                    'Dejar de postularse?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        print(
                                                            'el usuario creador es:');
                                                        print(
                                                            controladorpostulacion
                                                                .getPostulacion![
                                                                    posicion]
                                                                .idusercreador);

                                                        eliminarPostulacion(
                                                            controladorpostulacion
                                                                .getPostulacion![
                                                                    posicion]
                                                                .idvacante,
                                                            controladorpostulacion
                                                                .getPostulacion![
                                                                    posicion]
                                                                .idusercreador);
                                                        eliminarPostulado(
                                                            controladorpostulacion
                                                                .getPostulacion![
                                                                    posicion]
                                                                .idvacante,
                                                            controladorpostulacion
                                                                .getPostulacion![
                                                                    posicion]
                                                                .idusercreador);
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'Sí',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'Cancelar',
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ))
                                                ],
                                              ));
                                    },
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: 'Eliminar',
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 12, 15, 0),
                                        child: Text(controladorpostulacion
                                            .getPostulacion![posicion].empresa),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 15, 2),
                                        child: Text(
                                            controladorpostulacion
                                                .getPostulacion![posicion]
                                                .cargo,
                                            style: const TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 15, 2),
                                        child: Text(controladorpostulacion
                                            .getPostulacion![posicion].salario),
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
                                            Text(controladorpostulacion
                                                .getPostulacion![posicion]
                                                .ciudad),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.check_circle,
                                              size: 12,
                                            ),
                                            Text(
                                              " " +
                                                  controladorpostulacion
                                                      .getPostulacion![posicion]
                                                      .estado,
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Descripcion(
                                        controladorpostulacion
                                            .getPostulacion![posicion]
                                            .idusercreador,
                                        controladorpostulacion
                                            .getPostulacion![posicion]
                                            .idvacante,
                                        controladorpostulacion
                                            .getPostulacion![posicion]
                                            .fechacreacion,
                                        controladorpostulacion
                                            .getPostulacion![posicion].empresa,
                                        controladorpostulacion
                                            .getPostulacion![posicion].cargo,
                                        controladorpostulacion
                                            .getPostulacion![posicion]
                                            .descripcion,
                                        controladorpostulacion
                                            .getPostulacion![posicion]
                                            .requisitos,
                                        controladorpostulacion
                                            .getPostulacion![posicion].salario,
                                        controladorpostulacion
                                            .getPostulacion![posicion].ciudad,
                                        controladorpostulacion
                                            .getPostulacion![posicion]
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
