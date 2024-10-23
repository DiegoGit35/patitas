import '../enums/estado_de_caso.dart';
import '../enums/tipo_de_caso.dart';
import 'usuario.dart';

class Caso {
  String direccion, distrito, contacto, foto;
  String? fechaBaja, fechaRegistro, fechaResolucion;
  TipoDeCaso tipoDeCaso;
  EstadoDeCaso estado;
  Usuario usuarioRegistrante;
  Usuario? usuarioAdoptante;
  int? idCaso;

  Caso(
    this.idCaso,
    this.direccion,
    this.distrito,
    this.contacto,
    this.foto,
    this.fechaRegistro,
    this.fechaBaja,
    this.fechaResolucion,
    this.tipoDeCaso,
    this.usuarioRegistrante,
    this.estado,
  );
}
