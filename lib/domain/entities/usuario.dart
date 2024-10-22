import 'package:patitas/domain/entities/fecha.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';

// import '../enums/distrito.dart';

// TODO: fecha, sexo
class Usuario {
  late String nombre,
      apellido,
      email,
      contrasenia,
      direccion,
      telefono,
      sexo,
      distrito;

  late int? dni, idUsuario;
  late TipoDeUsuario tipo;
  // late Distrito distrito;
  late String? fechaBaja, fechaAlta;
  Fecha fechaNacimiento;

  Usuario({
    required this.nombre,
    required this.apellido,
    required this.sexo,
    required this.fechaNacimiento,
    required this.email,
    required this.contrasenia,
    required this.direccion,
    required this.distrito,
    required this.telefono,
    this.tipo = TipoDeUsuario.normal,
    this.dni,
  });
}
