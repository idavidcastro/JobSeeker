import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  @override
  Widget build(BuildContext context) {
    ConsultasControllerPostulados controladorpostulado = Get.find();
    controladorpostulado
        .consultaPostulados(widget.idvacante)
        .then((value) => null);

    final _paginas = <Widget>[
      Center(
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
          const Padding(padding: EdgeInsets.all(25.0)),
        ]),
      ),

      //otro widget otra pagina aqui abajo
      Obx(
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
                    onTap: () {
                      /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdicionarClientes(
                        gestioncliente: _clientes[index]), //Llamar la Vista
                  ),
                ).then((resultado) //Espera por un Resultado
                    {
                  if (resultado != null) {
                    _clientes[index] = resultado[
                        0]; //Adiciona a la lista lo que recupera de la vista TextoEjercicio
                    setState(() {});
                  }
                });
                */
                    },
                    leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          controladorpostulado.getPostulados![posicion].nombres
                              .substring(0, 1),
                          style: const TextStyle(color: Colors.white),
                        )),
                    title: Text(
                        controladorpostulado.getPostulados![posicion].nombres),
                    subtitle: Text(
                        controladorpostulado.getPostulados![posicion].telefono),
                    trailing: const Icon(Icons.call),
                  );
                })
            : const Icon(Icons.abc),
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
}
