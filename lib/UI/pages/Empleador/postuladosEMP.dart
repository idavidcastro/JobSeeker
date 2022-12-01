import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/domain/controller/controllerfirebasePostulados.dart';

import '../../../domain/controller/controllerfirebase.dart';

class PostuladosEMP extends StatefulWidget {
  String idvacante;
  PostuladosEMP(this.idvacante, {Key? key}) : super(key: key);

  @override
  State<PostuladosEMP> createState() => _PostuladosEMPState();
}

class _PostuladosEMPState extends State<PostuladosEMP> {
  @override
  Widget build(BuildContext context) {
    ConsultasControllerPostulados controladorpostulado = Get.find();
    controladorpostulado
        .consultaPostulados(widget.idvacante)
        .then((value) => null);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(' POSTULADOS'),
        backgroundColor: Colors.black,
      ),
      body: Obx(
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
                        child: Text(controladorpostulado
                            .getPostulados![posicion].correo
                            .substring(0, 1))),
                    title: Text(
                        controladorpostulado.getPostulados![posicion].correo),
                    subtitle: Text(
                        controladorpostulado.getPostulados![posicion].correo),
                    trailing: const Icon(Icons.call),
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
