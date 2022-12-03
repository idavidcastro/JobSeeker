class Usuario {
  final String foto;
  final String nombres;
  final String tipousuario;
  final String correo;
  final String contrasena;
  final String telefono;
  final String ciudad;
  final String cv;
  final String userid;
  final String estado;

  Usuario({
    required this.foto,
    required this.nombres,
    required this.tipousuario,
    required this.correo,
    required this.contrasena,
    required this.telefono,
    required this.ciudad,
    required this.cv,
    required this.userid,
    required this.estado,
  });

  factory Usuario.desdeDoc(Map<String, dynamic> data) {
    return Usuario(
      foto: data['foto'] ?? '',
      nombres: data['nombres'] ?? '',
      tipousuario: data['tipousuario'] ?? '',
      correo: data['correo'] ?? '',
      contrasena: data['contraseña'] ?? '',
      telefono: data['telefono'] ?? '',
      ciudad: data['ciudad'] ?? '',
      cv: data['cv'] ?? '',
      userid: data['userid'] ?? '',
      estado: data['estado'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "foto": foto,
        "nombres": nombres,
        "tipousuario": tipousuario,
        "correo": correo,
        "contraseña": contrasena,
        "telefono": telefono,
        "ciudad": ciudad,
        "cv": cv,
        "userid": userid,
        "estado": estado,
      };
}
