import 'package:get/get.dart';
import 'package:jobseeker/data/services/peticionfirebasePostulado.dart';
import 'package:jobseeker/domain/models/postulacion.dart';

import '../../data/services/peticionfirebasePostulacion.dart';

class ConsultasControllerPostulacion extends GetxController {
  final Rxn<List<Postulacion>> _postulacionFirestore = Rxn<List<Postulacion>>();

  Future<void> consultaDatosPostulacion() async {
    _postulacionFirestore.value =
        await PeticionesPostulacion.consultaDatosPostulacion();
  }

  List<Postulacion>? get getPostulacion => _postulacionFirestore.value;
}
