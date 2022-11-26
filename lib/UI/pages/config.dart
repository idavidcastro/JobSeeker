import 'package:flutter/material.dart';
import 'editarConfig.dart';
import 'login.dart';

class PageConfig extends StatefulWidget {
  final TextEditingController correo;
  const PageConfig(this.correo, {Key? key}) : super(key: key);

  @override
  State<PageConfig> createState() => _PageConfigState();
}

class _PageConfigState extends State<PageConfig> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('PERFIL'),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 70.0,
            ),
          ),
          const Divider(),
          Column(
            children: const [
              Text(
                'Información Personal',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('Rol: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Empleado'),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: const [
                    Text('Nombres: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Iván David'),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: const [
                    Text('Apellidos: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Castro Blanco'),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: const [
                    Text('Ciudad: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Valledupar, CO'),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
          const Divider(),
          //////////
          Column(
            children: const [
              Text(
                'Información Académica',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('Pregrado: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Ingeniero de Sistemas'),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: const [
                    Text('Universidad: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Universidad popular del Cesar'),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                const Divider()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const EditarConfig()),
                    );
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  highlightElevation: 20.0,
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: const Text('Modificar'),
                ),
                MaterialButton(
                  elevation: 10.0,
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  highlightElevation: 20.0,
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: const Text('Cerrar Sesión'),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
