class Vacante {
  final String iduser;
  final String idvacante;
  final String fechacreacion;
  final String empresa;
  final String cargo;
  final String descripcion;
  final String requisitos;
  final String salario;
  final String ciudad;
  final String estado;
  final String fecha;

  Vacante({
    required this.iduser,
    required this.idvacante,
    required this.fechacreacion,
    required this.empresa,
    required this.cargo,
    required this.descripcion,
    required this.requisitos,
    required this.salario,
    required this.ciudad,
    required this.estado,
    required this.fecha,
  });

  factory Vacante.desdeDoc(Map<String, dynamic> data) {
    return Vacante(
      iduser: data['iduser'] ?? '',
      idvacante: data['idvacante'] ?? '',
      fechacreacion: data['fechacreacion'] ?? '',
      empresa: data['empresa'] ?? '',
      cargo: data['cargo'] ?? '',
      descripcion: data['descripcion'] ?? '',
      requisitos: data['requisitos'] ?? '',
      salario: data['salario'] ?? '',
      ciudad: data['ciudad'] ?? '',
      estado: data['estado'] ?? '',
      fecha: data['fecha'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "idvacante": idvacante,
        "fechacreacion": fechacreacion,
        "empresa": empresa,
        "cargo": cargo,
        "descripcion": descripcion,
        "requisitos": requisitos,
        "salario": salario,
        "ciudad": ciudad,
        "estado": estado,
        "fecha": fecha,
      };
}
