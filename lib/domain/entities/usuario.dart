import 'package:patitas/domain/enums/tipo_de_usuario.dart';

// import '../enums/distrito.dart';

class Usuario {
  late String nombre,
      apellido,
      email,
      contrasenia,
      direccion,
      telefono,
      distrito;
  late int? dni, idUsuario;
  late TipoDeUsuario tipo;
  // late Distrito distrito;
  late String? fechaBaja, fechaAlta;

  Usuario({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.contrasenia,
    required this.direccion,
    required this.distrito,
    required this.telefono,
    this.tipo = TipoDeUsuario.normal,
    this.dni,
  });
}
