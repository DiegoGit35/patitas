import '../enums/estado_de_caso.dart';
import '../enums/tipo_de_caso.dart';

class Caso {
  String direccion, distrito, contacto, foto, usuarioRegistrante;
  String? fechaBaja, fechaRegistro, fechaResolucion, usuarioAdoptante, idCaso;
  TipoDeCaso tipoDeCaso;
  EstadoDeCaso? estado;

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
            ? TipoDeCaso.adopcion
            : map["tipo"] == "busqueda"
                ? TipoDeCaso.busqueda
                : TipoDeCaso.transito,
        usuarioRegistrante: map["usuarioRegistrante"],
        usuarioAdoptante: map["usuarioAdoptante"],
        estado: map["estado"] == "pendiente"
            ? EstadoDeCaso.pendiente
            : map["estado"] == "adoptado"
                ? EstadoDeCaso.adoptado
                : EstadoDeCaso.enTransito);
  }
}
