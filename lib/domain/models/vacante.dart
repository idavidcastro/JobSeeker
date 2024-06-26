class Vacante {
  final String iduser;
  final String idvacante;
  final String fecha;
  final String empresa;
  final String cargo;
  final String descripcion;
  final String requisitos;
  final String salario;
  final String ciudad;
  final String estado;

  Vacante({
    required this.iduser,
    required this.idvacante,
    required this.fecha,
    required this.empresa,
    required this.cargo,
    required this.descripcion,
    required this.requisitos,
    required this.salario,
    required this.ciudad,
    required this.estado,
  });

  factory Vacante.desdeDoc(Map<String, dynamic> data) {
    return Vacante(
      iduser: data['iduser'] ?? '',
      idvacante: data['idvacante'] ?? '',
      fecha: data['fecha'] ?? '',
      empresa: data['empresa'] ?? '',
      cargo: data['cargo'] ?? '',
      descripcion: data['descripcion'] ?? '',
      requisitos: data['requisitos'] ?? '',
      salario: data['salario'] ?? '',
      ciudad: data['ciudad'] ?? '',
      estado: data['estado'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "idvacante": idvacante,
        "fecha": fecha,
        "empresa": empresa,
        "cargo": cargo,
        "descripcion": descripcion,
        "requisitos": requisitos,
        "salario": salario,
        "ciudad": ciudad,
        "estado": estado,
      };
}
