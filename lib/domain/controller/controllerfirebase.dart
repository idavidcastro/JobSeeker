import 'package:get/get.dart';
import 'package:jobseeker/domain/models/vacante.dart';

import '../../data/services/peticionfirebase.dart';

class ConsultasController extends GetxController {
  final Rxn<List<Vacante>> _vacanteFirestore = Rxn<List<Vacante>>();
  /*
  Future<void> consultaVacantes() async {
    _vacanteFirestore.value = await PeticionesVacanates.consultarGral();
  }
  */
  Future<void> consultaVacantesFiltro(String cargo) async {
    _vacanteFirestore.value =
        await PeticionesVacanates.consultarGralFiltro(cargo);
  }

  List<Vacante>? get getVacantesGral => _vacanteFirestore.value;
}
