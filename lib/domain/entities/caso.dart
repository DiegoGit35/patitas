import '../enums/estado_de_caso.dart';
import '../enums/tipo_de_caso.dart';
import 'usuario.dart';

class Caso {
  late String direccion, distrito, contacto, foto;
  late String? fechaBaja, fechaRegistro;
  late TipoDeCaso tipoDeCaso;
  late EstadoDeCaso estado;
  late Usuario usuarioRegistrante;
  late Usuario? usuarioAdoptante;
  late int? idCaso;

  Caso({
    required this.direccion,
    required this.distrito,
    required this.contacto,
    required this.tipoDeCaso,
    required this.usuarioRegistrante,
    this.estado = EstadoDeCaso.pendiente,
  });
}
