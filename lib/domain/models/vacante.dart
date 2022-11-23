class Vacante {
  var empresa;
  var cargo;
  var salario;
  var ciudad;

  Vacante({this.empresa, this.cargo, this.salario, this.ciudad});
}

List<Vacante> listaVacantes = [
  Vacante(
      empresa: 'Apple',
      cargo: 'Diseñador Gráfico',
      salario: '3.000.000',
      ciudad: 'Los Angeles, CA'),
  Vacante(
      empresa: 'Grupo Aval',
      cargo: 'Ingeniero de Sistemas',
      salario: '5.000.000',
      ciudad: 'Valledupar, CO'),
  Vacante(
      empresa: 'Movistar',
      cargo: 'Asesor',
      salario: '1.500.000',
      ciudad: 'Bogotá, CO'),
];
