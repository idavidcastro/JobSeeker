import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/UI/pages/Empleado/editarconfig.dart';
import 'package:jobseeker/domain/controller/controllerfirebaseUsuario.dart';
import '../../../domain/controller/controladorAuth.dart';
import '../login.dart';

class PageConfig extends StatefulWidget {
  //final TextEditingController correo;
  const PageConfig({Key? key}) : super(key: key);

  @override
  State<PageConfig> createState() => _PageConfigState();
}

class _PageConfigState extends State<PageConfig> {
  @override
  Widget build(BuildContext context) {
    Controllerauthf controlf = Get.find();
    ConsultasControllerUsuarios controladorusuarios = Get.find();
    controladorusuarios.consultaPostulados(controlf.uid).then((value) => null);
    var imagen;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('PERFIL'),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.black,
        color: Colors.white,
        strokeWidth: 3,
        edgeOffset: 0,
        onRefresh: () {
          setState(() {});
          return Future<void>.delayed(const Duration(seconds: 2));
        },
        child: Obx(
          () => controladorusuarios.getUsuarios?.isEmpty == false
              ? ListView.builder(
                  itemCount: controladorusuarios.getUsuarios?.isEmpty == true
                      ? 0
                      : controladorusuarios.getUsuarios!.length,
                  itemBuilder: (context, posicion) {
                    var imagen;
                    return Column(
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.black,
                              child: controladorusuarios
                                          .getUsuarios![posicion].foto !=
                                      ''
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: Image.network(
                                        controladorusuarios
                                            .getUsuarios![posicion].foto,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Icon(Icons.person),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(33.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Rol: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        controladorusuarios
                                            .getUsuarios![posicion].tipousuario,
                                        style: const TextStyle(fontSize: 17)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    const Text('Nombres: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        controladorusuarios
                                            .getUsuarios![posicion].nombres,
                                        style: const TextStyle(fontSize: 17)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    const Text('Ciudad: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        controladorusuarios
                                            .getUsuarios![posicion].ciudad,
                                        style: const TextStyle(fontSize: 17)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    const Text('Correo: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        controladorusuarios
                                            .getUsuarios![posicion].correo,
                                        style: const TextStyle(fontSize: 17)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    const Text('Teléfono: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        controladorusuarios
                                            .getUsuarios![posicion].telefono,
                                        style: const TextStyle(fontSize: 17)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Icon(
                                Icons.document_scanner,
                                size: 50,
                              ),
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              btnmodificar(context),
                              btncerrarsesion(),
                            ],
                          ),
                        )
                      ],
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
    ));
  }

  Widget btnmodificar(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 50.0,
          color: Colors.black,
          onPressed: () {},
          child: Container(
            padding: const EdgeInsets.all(3),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditarConfig()),
                  );
                  setState(() {});
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ));
    });
  }

  Widget btncerrarsesion() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 50.0,
          color: Colors.black,
          onPressed: () {},
          child: Container(
            padding: const EdgeInsets.all(3),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Text('Cerrar Sesión'),
                            content: const Text('Desea cerrar sesión?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Login()),
                                    );
                                    setState(() {});
                                    //Navigator.pop(context);
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
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          ));
    });
  }
}
