import 'package:patitas/domain/entities/usuario.dart';

class UsuarioModel extends Usuario {
  UsuarioModel(
      {required idUsuario,
      required email,
      required contrasenia,
      required distrito,
      required telefono,
      required nombre,
      required apellido,
      required direccion,
      required fechaAlta,
      required fechaBaja})
      : super(
            nombre: '$nombre',
            apellido: '$apellido',
            email: '$email',
            contrasenia: '$contrasenia',
            direccion: '$direccion',
            distrito: '$distrito',
            telefono: '$telefono');

  factory UsuarioModel.fromSqfliteDatabase(
      Map<String, dynamic> usuarioBuscado) {
    final model = UsuarioModel(
      idUsuario: usuarioBuscado['id_usuario'],
      email: usuarioBuscado['email'],
      contrasenia: usuarioBuscado['contrasenia'],
      distrito: usuarioBuscado['distrito'],
      telefono: usuarioBuscado['telefono'],
      nombre: usuarioBuscado['nombre'],
      apellido: usuarioBuscado['apellido'],
      direccion: usuarioBuscado['direccion'],
      fechaAlta: usuarioBuscado['fecha_registro'],
      fechaBaja: usuarioBuscado['fecha_baja'],
    );
    return model;
  }
}



// final mov = MovimientoDeBiblioteca(
//       fecha: DateTime.parse(map['fecha']),
//       esDevolucion: map['es_devolucion'] == 1,
//       libro: Libro.fromSqfliteDatabase(map), // Mapea los datos del libro
//       usuario: Usuario.fromSqfliteDatabase(map), // Mapea los datos del usuario
//     );

//     return mov;
//   }