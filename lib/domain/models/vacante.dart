class Vacante {
  final String idVacante;
  final String empresa;
  final String cargo;
  final String salario;
  final String ciudad;

  Vacante({
    required this.idVacante,
    required this.empresa,
    required this.cargo,
    required this.salario,
    required this.ciudad,
  });

  factory Vacante.desdeDoc(Map<String, dynamic> data) {
    return Vacante(
      idVacante: data['id'] ?? '',
      empresa: data['empresa'] ?? '',
      cargo: data['cargo'] ?? '',
      salario: data['salario'] ?? '',
      ciudad: data['ciudad'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": idVacante,
        "empresa": empresa,
        "cargo": cargo,
        "salario": salario,
        "ciudad": ciudad,
      };
}
