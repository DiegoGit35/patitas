import '../enums/estado_de_caso.dart';
import '../enums/tipo_de_caso.dart';
import 'usuario.dart';

class Caso {
  String direccion, distrito, contacto, foto, usuarioRegistrante;
  String? fechaBaja, fechaRegistro, fechaResolucion, usuarioAdoptante;
  TipoDeCaso tipoDeCaso;
  EstadoDeCaso? estado;
  int? idCaso;

  Caso({
    this.idCaso,
    required this.direccion,
    required this.distrito,
    required this.contacto,
    required this.foto,
    this.fechaRegistro,
    this.fechaBaja,
    this.fechaResolucion,
    required this.tipoDeCaso,
    required this.usuarioRegistrante,
    this.usuarioAdoptante,
    this.estado,
  });

  factory Caso.fromMap(Map<String, dynamic> map) {
    return Caso(
        idCaso: map["idCaso"],
        direccion: map["direccion"] ?? '',
        distrito: map["distrito"] ?? '',
        contacto: map["contacto"],
        foto: map["foto"] ?? '',
        fechaRegistro: map["fechaRegistro"],
        fechaBaja: map["fechaBaja"],
        fechaResolucion: map["fechaResolucion"],
        tipoDeCaso: map["tipo"] == "adopcion"
            ? TipoDeCaso.Adopcion
            : map["tipo"] == "busqueda"
                ? TipoDeCaso.Busqueda
                : TipoDeCaso.Transito,
        usuarioRegistrante: map["usuarioRegistrante"],
        usuarioAdoptante: map["usuarioAdoptante"],
        estado: map["estado"] == "pendiente"
            ? EstadoDeCaso.pendiente
            : map["estado"] == "adoptado"
                ? EstadoDeCaso.adoptado
                : EstadoDeCaso.enTransito);
  }
}
