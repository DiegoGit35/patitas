import 'dart:core';

import 'package:patitas/domain/entities/fecha.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';

class Usuario {
  String? idUsuario;
  String? nombre;
  String? apellido;
  String? foto;
  DateTime? fechaNacimiento;
  String? email;
  String? contrasenia;
  String? direccion;
  String? distrito;
  String? telefono;
  TipoDeUsuario tipo;
  String? dni;
  String? sexo;


  Usuario({
    this.idUsuario,
    this.nombre,
    this.apellido,
    this.foto,
    this.fechaNacimiento,
    this.email,
    this.contrasenia,
    this.direccion,
    this.distrito,
    this.telefono,
    this.tipo  = TipoDeUsuario.normal,
    this.dni,
    this.sexo,
  });
}
