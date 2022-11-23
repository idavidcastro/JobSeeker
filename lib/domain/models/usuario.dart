class Usuario {
  var tipo_usuario;
  var usuario;
  var contrasena;
  var correo_electronico;

  Usuario(
      {this.usuario,
      this.contrasena,
      this.tipo_usuario,
      this.correo_electronico});
}

List<Usuario> listaUsuarios = [
  Usuario(
      tipo_usuario: 'Empleado',
      usuario: 'ivan',
      contrasena: '1',
      correo_electronico: 'afelipe@gmail.com'),
  Usuario(
      tipo_usuario: 'Empleador',
      usuario: 'ivan',
      contrasena: '2',
      correo_electronico: 'andres21@gmail.com'),
];
