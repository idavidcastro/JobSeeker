class Postulacion {
  final String cargo;
  final String ciudad;
  final String descripcion;
  final String empresa;
  final String estado;
  final String fechacreacion;
  final String idPostulado;
  final String idusercreador;
  final String idvacante;
  final String requisitos;
  final String salario;

  Postulacion({
    required this.cargo,
    required this.ciudad,
    required this.descripcion,
    required this.empresa,
    required this.estado,
    required this.fechacreacion,
    required this.idPostulado,
    required this.idusercreador,
    required this.idvacante,
    required this.requisitos,
    required this.salario,
  });

  factory Postulacion.desdeDoc(Map<String, dynamic> data) {
    return Postulacion(
      cargo: data['cargo'] ?? '',
      ciudad: data['ciudad'] ?? '',
      descripcion: data['descripcion'] ?? '',
      empresa: data['empresa'] ?? '',
      estado: data['estado'] ?? '',
      fechacreacion: data['fechacreacion'] ?? '',
      idPostulado: data['idPostulado'] ?? '',
      idusercreador: data['idusercreador'] ?? '',
      idvacante: data['idvacante'] ?? '',
      requisitos: data['requisitos'] ?? '',
      salario: data['salario'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "cargo": cargo,
        "ciudad": ciudad,
        "descripcion": descripcion,
        "empresa": empresa,
        "estado": estado,
        "fechacreacion": fechacreacion,
        "idPostulado": idPostulado,
        "idusercreador": idusercreador,
        "idvacante": idvacante,
        "requisitos": requisitos,
        "salario": salario,
      };
}
