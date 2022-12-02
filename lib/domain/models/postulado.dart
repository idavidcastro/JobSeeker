class Postulado {
  final String idPostulado;
  final String idusercreador;
  final String nombre;
  final String correo;
  final String telefono;
  final String ciudad;
  final String foto;
  final String cv;

  Postulado(
      {required this.idPostulado,
      required this.idusercreador,
      required this.nombre,
      required this.correo,
      required this.telefono,
      required this.ciudad,
      required this.foto,
      required this.cv});

  factory Postulado.desdeDoc(Map<String, dynamic> data) {
    return Postulado(
      idPostulado: data['idPostulado'] ?? '',
      idusercreador: data['idusercreador'] ?? '',
      nombre: data['nombre'] ?? '',
      correo: data['correo'] ?? '',
      telefono: data['telefono'] ?? '',
      ciudad: data['ciudad'] ?? '',
      foto: data['foto'] ?? '',
      cv: data['cv'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "idPostulado": idPostulado,
        "idusercreador": idusercreador,
        "nombre": nombre,
        "correo": correo,
        "telefono": telefono,
        "ciudad": ciudad,
        "foto": foto,
        "cv": cv,
      };
}
