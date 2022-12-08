import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controladorAuth.dart';
import '../../../domain/controller/controllerfirebasePostulados.dart';

class DescripcionEMP extends StatefulWidget {
  String iduser;
  String idvacante;
  String fechacreacion;
  String empresa;
  String cargo;
  String descripcion;
  String requisitos;
  String salario;
  String ciudad;
  String estado;
  DescripcionEMP(
      this.iduser,
      this.idvacante,
      this.fechacreacion,
      this.empresa,
      this.cargo,
      this.descripcion,
      this.requisitos,
      this.salario,
      this.ciudad,
      this.estado,
      {Key? key})
      : super(key: key);

  @override
  State<DescripcionEMP> createState() => _DescripcionEMPState();
}

class _DescripcionEMPState extends State<DescripcionEMP> {
  final firebase = FirebaseFirestore.instance;
  Controllerauthf controlf = Get.find();

  @override
  Widget build(BuildContext context) {
    ConsultasControllerPostulados controladorpostulado = Get.find();
    controladorpostulado
        .consultaPostulados(widget.idvacante)
        .then((value) => null);

    final _paginas = <Widget>[
      Container(
        width: 0,
        height: 0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0,
            )
          ],
        ),
        child: Column(children: [
          const Padding(padding: EdgeInsets.all(20.0)),
          const Text('ID VACANTE ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Padding(padding: EdgeInsets.all(5.0)),
          Text(
            widget.idvacante,
            style: const TextStyle(fontSize: 18.0),
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          const Text('EMPRESA ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.empresa, style: const TextStyle(fontSize: 18.0)),
          const Padding(padding: EdgeInsets.all(10.0)),
          const Text(' CARGO ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.cargo, style: const TextStyle(fontSize: 18.0)),
          const Padding(padding: EdgeInsets.all(10.0)),
          const Text('SALARIO ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.salario, style: const TextStyle(fontSize: 18.0)),
          const Padding(padding: EdgeInsets.all(10.0)),
          const Text('CIUDAD ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(widget.ciudad, style: const TextStyle(fontSize: 18.0)),
          const Padding(padding: EdgeInsets.all(25.0))
        ]),
      ),

      //otro widget otra pagina aqui abajo
      RefreshIndicator(
        onRefresh: () {
          setState(() {});
          return Future<void>.delayed(const Duration(seconds: 2));
        },
        backgroundColor: Colors.black,
        color: Colors.white,
        strokeWidth: 3,
        edgeOffset: 0,
        child: Obx(
          () => controladorpostulado.getPostulados?.isEmpty == false
              ? ListView.builder(
                  itemCount: controladorpostulado.getPostulados?.isEmpty == true
                      ? 0
                      : controladorpostulado.getPostulados!.length,
                  itemBuilder: (context, posicion) {
                    return ListTile(
                      onLongPress: () {
                        // _eliminarclientes(context, _clientes[0]);
                      },
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (ctx) => bottondesplegable(
                            ctx,
                            controladorpostulado.getPostulados![posicion].foto,
                            controladorpostulado
                                .getPostulados![posicion].nombres,
                            controladorpostulado
                                .getPostulados![posicion].ciudad,
                            controladorpostulado
                                .getPostulados![posicion].correo,
                            controladorpostulado
                                .getPostulados![posicion].telefono,
                            controladorpostulado.getPostulados![posicion].cv,
                            controladorpostulado
                                .getPostulados![posicion].estado,
                            controladorpostulado
                                .getPostulados![posicion].userid,
                            widget.idvacante),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: controladorpostulado
                                    .getPostulados![posicion].foto !=
                                ''
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  controladorpostulado
                                      .getPostulados![posicion].foto,
                                  width: 58,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(Icons.person),
                      ),
                      title: Text(controladorpostulado
                          .getPostulados![posicion].nombres),
                      subtitle: Text(controladorpostulado
                          .getPostulados![posicion].telefono),
                      trailing: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            FlutterPhoneDirectCaller.callNumber(
                                controladorpostulado
                                    .getPostulados![posicion].telefono);
                          },
                          icon: const Icon(Icons.call)),
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
    ];
    final _kTabs = <Tab>[
      const Tab(
        text: 'Descripción',
      ),
      const Tab(
        text: 'Postulados',
      ),
    ];
    print('id user es: ');
    print(widget.iduser);
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DETALLES DE LA OFERTA'),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _paginas,
        ),
      ),
    );
  }

  Container bottondesplegable(
      BuildContext context,
      String foto,
      String nombres,
      String ciudad,
      String correo,
      String telefono,
      String cv,
      String estado,
      String userid,
      String idvacante) {
    String? valueChooseEstados = 'Aplicada';
    List<String> listaDeEstados = [
      'Aplicada',
      'CV Visto',
      'En proceso',
      'Finalista'
    ];

    return Container(
      height: 400,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(33.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Nombres: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(nombres, style: const TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  const Text('Ciudad: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(ciudad, style: const TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  const Text('Correo: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(correo, style: const TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  const Text('Teléfono: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(telefono, style: const TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  const Text('Estado: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(estado, style: const TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.document_scanner,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
              child: DropdownButton(
                value: valueChooseEstados,
                onChanged: (String? value) {
                  setState(() {
                    valueChooseEstados = value;
                  });
                },
                items: listaDeEstados
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Guardar y cerrar'),
                onPressed: () {
                  actualizarEstado(
                      idvacante, userid, valueChooseEstados.toString());
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ]),
    );
  }

  actualizarEstado(String idvacante, String userid, String estado) async {
    try {
      //crear postulacion para empleado
      await firebase
          .collection('Usuarios')
          .doc(controlf.uid)
          .collection('Vacantes')
          .doc(idvacante)
          .collection('Postulados')
          .doc(userid)
          .update({
        "estado": estado,
      });
      await firebase
          .collection('Usuarios')
          .doc(userid)
          .collection('Postulaciones')
          .doc(idvacante)
          .update({
        "estado": estado,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error...' + e.toString());
      }
    }
  }
}
