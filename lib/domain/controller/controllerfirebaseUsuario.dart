import 'package:get/get.dart';
import 'package:jobseeker/data/services/peticionfirebaseUsuario.dart';
import 'package:jobseeker/domain/models/usuario.dart';

class ConsultasControllerUsuarios extends GetxController {
  final Rxn<List<Usuario>> _usuarioFirestore = Rxn<List<Usuario>>();

  Future<void> consultaPostulados(String idusuario) async {
    _usuarioFirestore.value =
        await PeticionesUsuarios.consultarUsuarios(idusuario);
  }

  List<Usuario>? get getUsuarios => _usuarioFirestore.value;
}
