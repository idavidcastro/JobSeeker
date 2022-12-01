class Postulado {
  final String correo;
  final String idPostulacion;
  final String idusercreador;

  Postulado(
      {required this.correo,
      required this.idPostulacion,
      required this.idusercreador,
      re});

  factory Postulado.desdeDoc(Map<String, dynamic> data) {
    return Postulado(
      correo: data['correo'] ?? '',
      idPostulacion: data['idPostulacion'] ?? '',
      idusercreador: data['idusercreador'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "correo": correo,
        "idPostulacion": idPostulacion,
        "idusercreador": idusercreador,
      };
}
