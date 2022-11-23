import 'package:flutter/material.dart';

class EditarConfig extends StatefulWidget {
  const EditarConfig({Key? key}) : super(key: key);

  @override
  State<EditarConfig> createState() => _EditarConfigState();
}

class _EditarConfigState extends State<EditarConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('Modificar Perfil'),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _titulo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      //hintText: 'Tipo Usuario',
                      labelText: 'Nombres',
                      icon: const Icon(Icons.business),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          //controlEmpresa.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Pregrado',
                      icon: const Icon(Icons.person),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          //controlCargo.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Universidad',
                      icon: const Icon(Icons.location_city),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          //controlSalario.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Ciudad',
                      icon: const Icon(Icons.location_on),
                      // suffix: Icon(Icons.access_alarm),
                      suffix: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          //controlCiudad.clear();
                        },
                      )
                      //probar suffix
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: MaterialButton(
                  elevation: 10.0,
                  onPressed: () {
                    // dialogo
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('Modificar Perfil'),
                              content:
                                  const Text('Se ha modificado correctamente.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            ));
                    // Devuelvo los datos de la lista _usuarioadd
                    /*
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ListarUsuario())); //Llamar la Vista
                      */
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  highlightElevation: 20.0,
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: const Text(
                    'Modificar Perfil',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _titulo() {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        "Modificar Perfil",
        style: TextStyle(
            color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
