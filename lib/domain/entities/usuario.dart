import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.tipo = TipoDeUsuario.normal,
    this.dni,
    this.sexo,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
    // idUsuario: documentId, 
      nombre: map["nombre"] ?? '',
      apellido: map["apellido"] ?? '',
      foto: map["foto"] ?? '',
      fechaNacimiento: (map["fechaNacimiento"] as Timestamp).toDate(),
      email: map["email"] ?? '',
      contrasenia: map["contrasenia"] ?? '',
      direccion: map["direccion"] ?? '',
      distrito: map["distrito"] ?? '',
      telefono: map["telefono"] ?? '',
      tipo: map["tipo"] == "administrador"
          ? TipoDeUsuario.administrador
          : TipoDeUsuario.normal,
      dni: map["dni"] ?? '',
      sexo: map["sexo"] ?? '',
    );
  }
}
