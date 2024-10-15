import 'package:patitas/entidades/fecha.dart';

class Usuario {
  String nombre;
  String apellido;
  String telefonoOEmail;
  String password;
  Fecha fechaNacimiento;
  String genero;
  Usuario(
      {required this.nombre,
      required this.apellido,
      required this.telefonoOEmail,
      required this.password,
      required this.fechaNacimiento,
      required this.genero});

  @override
  String toString() {
    return "nombre:$nombre\napellido:$apellido\ntelefono o email:$telefonoOEmail\npassword:$password\nfecha de nacimiento:$fechaNacimiento\ngenero:$genero";
  }
}
