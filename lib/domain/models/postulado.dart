class Postulado {
  final String ciudad;
  final String contrasena;
  final String correo;
  final String cv;
  final String foto;
  final String nombres;
  final String telefono;
  final String tipousuario;
  final String userid;

  Postulado(
      {required this.ciudad,
      required this.contrasena,
      required this.correo,
      required this.cv,
      required this.foto,
      required this.nombres,
      required this.telefono,
      required this.tipousuario,
      required this.userid});

  factory Postulado.desdeDoc(Map<String, dynamic> data) {
    return Postulado(
      ciudad: data['ciudad'] ?? '',
      contrasena: data['contraseña'] ?? '',
      correo: data['correo'] ?? '',
      cv: data['cv'] ?? '',
      foto: data['foto'] ?? '',
      nombres: data['nombres'] ?? '',
      telefono: data['telefono'] ?? '',
      tipousuario: data['tipousuario'] ?? '',
      userid: data['userid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "ciudad": ciudad,
        "contraseña": contrasena,
        "correo": correo,
        "cv": cv,
        "foto": foto,
        "nombres": nombres,
        "telefono": telefono,
        "tipousuario": tipousuario,
        "userid": userid,
      };
}
