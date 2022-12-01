import 'package:get/get.dart';
import 'package:jobseeker/data/services/peticionfirebasePostulado.dart';

import '../models/postulado.dart';

class ConsultasControllerPostulados extends GetxController {
  final Rxn<List<Postulado>> _postuladoFirestore = Rxn<List<Postulado>>();

  Future<void> consultaPostulados(String idvacante) async {
    _postuladoFirestore.value =
        await PeticionesPostulados.consultarPostulados(idvacante);
  }

  List<Postulado>? get getPostulados => _postuladoFirestore.value;
}
